class ItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@items = @search.result 
		@user = current_user
  end

	def show
		@item = Item.find(params[:id])
		@user = @item.user
		@log = Log.new
		@logs = Log.where(item_id: @item.id)
		@comment = Comment.new
	end

	def new
		@item = Item.new
	end

	def create
		item = Item.new(item_params)
		if item.save!
			redirect_to item_path(item)
		else
			redirect_to top_path
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		item = Item.find(params[:id])
		item.update(item_params)
		redirect_to item_path(item)
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to items_path
	end

	def like
		@user = User.find(params[:id])
		@items = User.find(params[:id]).liked_items
	end

	private

	def item_params
	  params.require(:item).permit(:name, :user_id, :image, :category_id, :infomation, :price, :place, :score, :open_range)
	end
end
