class ItemsController < ApplicationController
	def index
		@items = current_user.items
	end

	def show
		@item = Item.find(params[:id])
		@log = Log.new
		@logs = Log.where(item_id: @item.id)
	end

	def new
		@item = Item.new
	end

	def create
		item = Item.new(item_params)
		if item.save
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

	def user
		@items = User.find(params[:id]).items
	end

	def like
		@items = User.find(params[:id]).liked_items
	end

	private

	def item_params
	  params.require(:item).permit(:name, :user_id, :image, :category_id, :infomation, :price, :place, :score, :open_range)
	end
end
