class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_user_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counters, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_most_recent_comments
    comments.last(5)
  end

  private

  def update_user_post_counter
    user.posts_counter += 1
  end
end
