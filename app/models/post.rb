class Post < ApplicationRecord
  belongs_to :users
  has_many :likes, :comments

  def update_user_post_counter
    users.posts_counter += 1
  end

  def return_most_recent_comments
    comments.last(5)
  end
end
