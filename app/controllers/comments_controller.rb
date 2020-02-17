class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		comment = Comment.new(comment_params)
		comment.save
		@log = comment.log
		@comment = Comment.new
	end

	def destroy
		comment = Comment.find(params[:id])
		@log = comment.log
		comment.destroy
		@comment = Comment.new
	end

	def comment_params
	  params.require(:comment).permit(:user_id, :log_id, :body)
	end
end