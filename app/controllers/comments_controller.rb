class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Your comment has been added!'
      redirect_to [@post.user, @post]
    else
      flash.now[:error] = 'Comment could not be added'
      render user_post_path
    end
  end

  def destroy
    puts 'Removing Comment'
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy!
    flash[:success] = 'Removed comment!'
    redirect_back fallback_location: [post.user, post]
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
