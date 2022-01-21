class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    like = current_user.likes.create(post: post)
    like.save!
    redirect_to user_post_url
  end
end
