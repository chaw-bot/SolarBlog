module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = current_user.posts.includes(:comments)
        render json: @posts
      end
    end
  end
end
