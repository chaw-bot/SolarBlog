module Api
  module V1
    class CommentsController < ApplicationController
      load_and_authorize_resource

      def index
        @comments = Comment.where({ post_id: params[:post_id] }).order('created_at DESC')
        render json: { success: true, data: { comments: @comments } }
      end

      def create
        comment = Comment.new(comments_params)
        comment.post_id = params[:post_id]
        comment.user = current_user

        if comment.save
          render json: { status: 201, message: 'Comment created successfully!', content: { comment: comment } }
        else
          render json: comment.errors, status: :bad_request, message: 'Operation failed'
        end
      end

      private

      def find_user
        User.find(params[:user_id])
      end

      def show_post
        find_user.posts.find(params[:post_id])
      end

      def comments_params
        params.require(:comment).permit(:text, :user_id, :post_id)
      end
    end
  end
end
