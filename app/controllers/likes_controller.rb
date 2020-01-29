class LikesController < ApplicationController
	before_action :authenticate_user!

  def create
		@like = Like.new(user_id: params[:user_id], item_id: params[:item_id])
		# path_redirect(@favorite.save)
		@like.save!
		redirect_back(fallback_location: top_path)
	end

	def destroy
		@like = Like.find_by(user_id: params[:user_id], item_id: params[:item_id])
		# path_redirect(@favorite.destroy)
		@like.destroy
		redirect_back(fallback_location: top_path)
	end
end
