class Comment < ApplicationRecord
  belong_to :posts, :users

  def update_comment_counter
    posts.comments_counter += 1
  end
end
