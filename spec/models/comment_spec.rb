require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', posts_counter: 0)
    Post.new(title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"',
             likes_counters: 0, comments_counter: 0, user: user)
  end

  before { subject.save }

  it 'should return most recent comments' do
    user = User.new(name: 'Lenny', photo: 'image', bio: 'bio', posts_counter: 0)
    subject.comments.create!(user: user, text: 'Well said.')
    subject.comments.create!(user: user, text: 'I would not have said it better')

    expect(subject.comments_counter).to eql 2
  end
end
