require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new( name: 'Lenny', photo: "image", bio: "bio", posts_counter: 0 )}
  
  before { subject.save }

  it 'should return the last three posts' do
    post1 = subject.posts.create!( title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"', likes_counters: 0, comments_counter: 0)
    post2 = subject.posts.create!( title: 'Is it a Language?', text: 'Why people say HTML is not a programming language...', likes_counters: 0, comments_counter: 0)
    post3 = subject.posts.create!( title: 'Attack On Titan', text: 'With the clif hanger seen in the first half of season 4, do you think...', likes_counters: 0, comments_counter: 0)
    post4 = subject.posts.create!( title: 'Naruto', text: 'Is it fair to say Naruto is a bit too long and can be a d...', likes_counters: 0, comments_counter: 0)
    
    posts = subject.return_last_three_posts
    expect(posts.length).to eql 3
    expect(posts).to match_array([post4, post3, post2])
  end

  it 'should check validation' do
    expect(subject).to be_valid
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
end