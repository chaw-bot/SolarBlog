module Api
  module V1
    class CommentsController < ApplicationController
      before_action :get_post

      def index
        @comments = show_post.comments.includes(:user)
      end

      private

      def show_post
        Post.find(params[:post_id])
      end
    end
  end
end
