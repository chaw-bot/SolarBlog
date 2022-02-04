module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.all.order('created_at DESC')
        render json: { success: true, data: { comments: @posts } }
      end

      def show
        @show_post = current_user.posts.includes(:comments)
        render json: { success: true, data: { comments: @show_post } }
      end
    end
  end
end
