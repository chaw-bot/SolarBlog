class Comment < ApplicationRecord
  belongs_to :post, :user

  after_save :update_comment_counter

  def update_comment_counter
    post.comments_counter += 1
  end
end
