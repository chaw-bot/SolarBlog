class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post.user, @post], notice: "Comment was successfully created." }
      else
        format.html { render :new }
      end
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