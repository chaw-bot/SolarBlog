require 'rails_helper'

RSpec.describe 'User index page' do
  it 'I can see the username of all other users' do
    visit('/users')
    all('div h2.card-title').map(&:text)
    things = Think.all
    expected_content = things.map(&title)
    actual_content = all('div h2.card-title').map(&:text)

    expect(actual_content).to eq(expected_content)
  end
end
