require 'rails_helper'

RSpec.describe Post, type: :model do
    subject {
        user = User.new( name: 'Lenny', photo: "image", bio: "bio", posts_counter: 0 )
        Post.new( title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"', likes_counters: 0, comments_counter: 0, user: user)
    }

    before { subject.save }
  
    it 'should check validation' do
      expect(subject).to be_valid
    end

    it 'should have 250 characters' do
        subject.title = 'f'*300
        expect(subject).to_not be_valid
    end

    it 'should be invalid if comment counter is nil' do
        subject.comments_counter = nil
        expect(subject).to_not be_valid
    end

    it 'should be invalid if like counter is nil' do
        subject.likes_counters = nil
        expect(subject).to_not be_valid
    end

    it 'should return most recent comments' do
        user = User.new( name: 'Lenny', photo: "image", bio: "bio", posts_counter: 0 )
        comment1 = subject.comments.create!(user: user ,text: 'Well said.')
        comment2 = subject.comments.create!(user: user ,text: 'I would not have said it better')
        comment3 = subject.comments.create!(user: user ,text: 'Well I desagree...')
        comment4 = subject.comments.create!(user: user ,text: 'Thats not true..')
        comment5 = subject.comments.create!(user: user ,text: 'Hmmmm well...')
        comment6 = subject.comments.create!(user: user ,text: 'Thats not what he said')

        comments = subject.return_most_recent_comments
        expect(comments.length).to eql 5
        expect(comments).to match_array([comment6, comment5, comment4, comment3, comment2])
    end

    it 'should update user post  counter' do
        expect(subject.user.posts_counter).to eql 1
    end
end