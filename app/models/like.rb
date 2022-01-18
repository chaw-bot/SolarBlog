class Like < ApplicationRecord
  belong_to :posts, :users

  def update_comment_counter
    posts.likes_counter += 1
  end
end
