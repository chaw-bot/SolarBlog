class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, :comments

  after_save :update_user_post_counter

  def return_most_recent_comments
    comments.last(5)
  end

  private

  def update_user_post_counter
    user.posts_counter += 1
  end
end
