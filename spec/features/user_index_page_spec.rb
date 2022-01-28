require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @photo = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
    @user_one = User.create(name: 'Joe',
                            photo: @photo, email: 'joe@example.com', password: 'r89eudhbgvb', posts_counter: 6)
    @user_two = User.create(name: 'Paulo',
                            photo: @photo, email: 'paulo@example.com', password: 'r89eudhbgvb', posts_counter: 0)
    @user_three = User.create(name: 'Lenny',
                              photo: @photo, email: 'lenny@example.com', password: 'r89eudhbgvb', posts_counter: 8)
    fill_in 'Email', with: 'joe@gmail.com'
    fill_in 'Password', with: 'r89eudhbgvb'
    click_button 'Log in'
    visit users_path
  end

  it 'should see the username of all other users.' do
    expect(page).to have_content('Joe')
    expect(page).to have_content('Paulo')
    expect(page).to have_content('Lenny')
  end

  it 'Should see the profile picture for each user.' do
    images = page.all('img')
    user_names = page.all('div h2')
    expect(images.size).to eql(user_names.size)
  end

  it 'Should see the number of posts each user has written.' do
    subscribers = page.all('.card')
    expect(subscribers[0]).to have_content 'Number of posts: 6'
    expect(subscribers[1]).to have_content 'Number of posts: 0'
    expect(subscribers[2]).to have_content 'Number of posts: 8'
  end

  it 'Should redirected user show page when click on user' do
    click_link 'Joe'
    expect(page).to have_current_path user_path(@user_one.id)
  end
end
