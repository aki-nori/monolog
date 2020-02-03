class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_item

 	def create
		@like = Like.new(user_id: params[:user_id], item_id: params[:item_id])
		@like.save
	end

	def destroy
		@like = Like.find_by(user_id: params[:user_id], item_id: params[:item_id])
		@like.destroy
	end

	private

	def set_item
		@item = Item.find(params[:item_id])
	end
end
