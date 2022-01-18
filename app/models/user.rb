class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts

  def return_last_three_posts
    posts.last(3)
  end
end
