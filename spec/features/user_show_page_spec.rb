require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @photo = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
    @user_one = User.create(name: 'Joe', photo: @photo, bio: 'Lorem ipsum dolor sit amet', email: 'joe@example.com',
                            password: 'r89eudhbgvb', posts_counter: 6)
    fill_in 'Email', with: 'joe@gmail.com'
    fill_in 'Password', with: 'r89eudhbgvb'
    click_button 'Log in'
    @post1 = @user_one.posts.create!(title: 'To Be',
                                     text: 'The big question is: "To be or not to be a Ruby programmer"',
                                     likes_counters: 0,
                                     comments_counter: 0)
    @post2 = @user_one.posts.create!(title: 'Is it a Language?',
                                     text: 'Why people say HTML is not a programming language...',
                                     likes_counters: 0,
                                     comments_counter: 0)
    @post3 = @user_one.posts.create!(title: 'Attack On Titan',
                                     text: 'With the clif hanger seen in the first half of season 4, do you think...',
                                     likes_counters: 0,
                                     comments_counter: 6)
    visit user_path(@user_one)
  end

  it 'Should see the user\'s profile picture' do
    image_src = page.find('img')['src']
    expect(image_src).to eql @photo
  end

  it 'Should see the user\'s username' do
    expect(page).to have_content 'Joe'
  end

  it 'Should see the number of posts the user has written' do
    expect(page).to have_content 'Number of posts: 6'
  end

  it 'Should see the user\'s bio' do
    expect(page).to have_content 'Lorem ipsum dolor sit amet'
  end

  it 'Should see the user\'s first 3 posts.' do
    expect(page).to have_content 'The big question is: "To be or not to be a Ruby programmer"'
    expect(page).to have_content 'Why people say HTML is not a programming language...'
    expect(page).to have_content 'With the clif hanger seen in the first half of season 4, do you think...'
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    click_link 'Attack On Titan'
    expect(page).to have_current_path user_post_path(@user_one, @post3)
  end

  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user_one)
  end
end
