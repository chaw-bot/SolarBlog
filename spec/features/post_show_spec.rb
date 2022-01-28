require 'rails_helper'

RSpec.feature 'post show page', js: true, type: :feature do
  background do
    visit user_session_path

    image = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
    bio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Fusce risus mi, luctus id ligula nec, malesuada rhoncus tortor.
    Ut egestas mollis erat. Aliquam imperdiet nisi ac porttitor imperdiet.
    Etiam lacus lorem, euismod eu porttitor porttitor, accumsan eget risus.
    Etiam at diam id nunc aliquet interdum ut in sapien. Sed ultrices
    eleifend massa, eget mattis magna sollicitudin fringilla.
    Mauris ac venenatis nisi, ac semper eros. Vivamus in facilisis ipsum.
    '
    @lenny = User.create!(name: 'Lenny', photo: image, bio: bio, posts_counter: 0, email: 'lenny@mail.com',
                          password: 'r89eudhbgvb', confirmed_at: Time.now)
    fill_in 'Email', with: 'lenny@mail.com'
    fill_in 'Password', with: 'r89eudhbgvb'
    click_button 'Log in'

    post = @lenny.posts.create!(title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"',
                                likes_counters: 0, comments_counter: 0)

    mel = User.create!(name: 'Mel', photo: image, bio: bio, posts_counter: 0, email: 'mel@mail.com',
                       password: 'r89eudhbgvb', confirmed_at: Time.now)
    mel.comments.create!(text: 'Well said.', post: post)
    mel.comments.create!(text: 'I would not have said it better', post: post)
    visit user_post_path(@lenny, post)
  end

  it "see the post's title" do
    expect(page).to have_content 'To Be'
  end

  it 'can see who wrote the post.' do
    expect(page).to have_content 'Lenny'
  end

  it 'can see how many comments it has.' do
    expect(page).to have_content 'Comments: 2'
  end

  it 'can see how many likes it has.' do
    expect(page).to have_content 'Likes: 0'
  end

  it 'can see the post body.' do
    expect(page).to have_content 'The big question is: "To be or not to be a Ruby programmer"'
  end

  it 'can see the username of each commentor.' do
    expect(page).to have_content 'Mel'
  end

  it 'can see the comment each commentor left.' do
    expect(page).to have_content 'Well said.'
    expect(page).to have_content 'I would not have said it better'
  end
end
