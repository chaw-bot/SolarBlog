class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    like = current_user.likes.create(post: post)
    like.save!

    if like.save
      flash[:success] = 'Post Liked!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Like not added...'
      render user_post_path
    end
  end
end
