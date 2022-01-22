class CommentsController < ApplicationController
  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(text: params[:text])
    comment.post = post

    if comment.save
      flash[:success] = 'Your comment has been added!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Comment could not be added'
      render user_post_path
    end
  end
end
