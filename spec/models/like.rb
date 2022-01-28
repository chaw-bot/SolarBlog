require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', posts_counter: 0)
    Post.new(title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"',
             likes_counters: 0, comments_counter: 0, user: user)
  end

  user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', posts_counter: 0)

  before { user.save }

  it 'should return most recent comments' do
    user.likes.create!(post: subject)
    user.likes.create!(post: subject)
    user.likes.create!(post: subject)

    expect(subject.likes_counters).to eql 3
  end
end
