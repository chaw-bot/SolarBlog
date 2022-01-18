class Comment < ApplicationRecord
    belong_to :posts, :users
end
