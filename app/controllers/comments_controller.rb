class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)

		# 非同期用
		@comment.save

		@log = @comment.log
		@comment = Comment.new
	end

	def destroy
		comment = Comment.find(params[:id])
		@log = comment.log
		
		comment.destroy

		# 非同期用
		@comment = Comment.new
	end

	def comment_params
	  params.require(:comment).permit(:user_id, :log_id, :body)
	end
end