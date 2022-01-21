class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    add_post = @user.posts.new(post_params)
    add_post.comments_counter = 0
    add_post.likes_counters = 0
    respond_to do |format|
      format.html do
        if add_post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: add_post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
