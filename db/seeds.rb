# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

image = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
bio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Fusce risus mi, luctus id ligula nec, malesuada rhoncus tortor.
  Ut egestas mollis erat. Aliquam imperdiet nisi ac porttitor imperdiet.
  Etiam lacus lorem, euismod eu porttitor porttitor, accumsan eget risus.
  Etiam at diam id nunc aliquet interdum ut in sapien. Sed ultrices
  eleifend massa, eget mattis magna sollicitudin fringilla.
  Mauris ac venenatis nisi, ac semper eros. Vivamus in facilisis ipsum.
'

user1 = User.create!( name: 'Lenny', photo: image, bio: bio, posts_counter: 0, email: 'lenny@mail.com', password: 'qwd43rfews' )

user2 = User.create!( name: 'Mel', photo: image, bio: bio, posts_counter: 0, email: 'mel@mail.com', password: 'qwd43rfews' )

user3 = User.create!( name: 'Joe', photo: image, bio: bio, posts_counter: 0, email: 'joe@mail.com', password: 'qwd43rfews' )

user4 = User.create!( name: 'Paulo', photo: image, bio: bio, posts_counter: 0, email: 'paulo@mail.com', password: 'qwd43rfews' )

post1 = user1.posts.create!( title: 'To Be', text: 'The big question is: "To be or not to be a Ruby programmer"', likes_counters: 0, comments_counter: 0)
post2 = user2.posts.create!( title: 'Is it a Language?', text: 'Why people say HTML is not a programming language...', likes_counters: 0, comments_counter: 0)
post3 = user3.posts.create!( title: 'Attack On Titan', text: 'With the clif hanger seen in the first half of season 4, do you think...', likes_counters: 0, comments_counter: 0)
post4 = user4.posts.create!( title: 'Naruto', text: 'Is it fair to say Naruto is a bit too long and can be a d...', likes_counters: 0, comments_counter: 0)
post5 = user1.posts.create!( title: 'Pineapple on Pizza', text: 'The real debate behind pineapple on...', likes_counters: 0, comments_counter:0)
post6 = user2.posts.create!( title: 'The Royal family', text: 'What about them really..', likes_counters: 0, comments_counter: 0)
post7 = user3.posts.create!( title: 'Summer or winter', text: 'Each season matches your mood....', likes_counters: 0, comments_counter: 0)
post8 = user4.posts.create!( title: 'F1: Mercedes new driver', text: 'Is he too young for the shoes...', likes_counters: 0, comments_counter: 0)

comment1 = post1.comments.create!(user: user1 ,text: 'Well said.')
comment2 = post2.comments.create!(user: user2 ,text: 'I would not have said it better')
comment3 = post3.comments.create!(user: user3 ,text: 'Well I desagree...')
comment4 = post4.comments.create!(user: user4 ,text: 'Thats not true..')
comment5 = post5.comments.create!(user: user1 ,text: 'Hmmmm well...')
comment6 = post6.comments.create!(user: user2 ,text: 'Thats not what he said')
comment7 = post7.comments.create!(user: user3 ,text: 'Please write a part two')
comment8 = post8.comments.create!(user: user4 ,text: 'Well here we go again')

user1.likes.create!(post: post1)
user2.likes.create!(post: post2)
user3.likes.create!(post: post3)
user4.likes.create!(post: post4)
user1.likes.create!(post: post5)
user2.likes.create!(post: post6)
user3.likes.create!(post: post1)
user4.likes.create!(post: post7)
user1.likes.create!(post: post5)
user2.likes.create!(post: post6)
user3.likes.create!(post: post8)
user4.likes.create!(post: post3)
user1.likes.create!(post: post2)
user2.likes.create!(post: post1)
user3.likes.create!(post: post8)
user4.likes.create!(post: post1)
