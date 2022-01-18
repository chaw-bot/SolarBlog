class Like < ApplicationRecord
    belong_to :posts, :users
end
