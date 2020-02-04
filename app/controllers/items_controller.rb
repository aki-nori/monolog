class ItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user

		@q = Item.search(params[:q])
    	@items = @q.result(distinct: true).page(params[:page]).per(12)
  	end

	def tag
		@user = current_user
		@items = Item.all
		@tag = params[:tag_name].to_s
		if params[:tag_name]
    	@items = @items.tagged_with("#{params[:tag_name]}").page(params[:page]).per(12)
    else
    	@items = @items.page(params[:page]).per(12)
    end
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
		@item = Item.new(item_params)
		if @item.save
			redirect_to item_path(@item)
		else
			render action: :new
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
		@items = User.find(params[:id]).liked_items.page(params[:page]).per(12)
	end

	private

	def item_params
	  params.require(:item).permit(:name, :user_id, :image, :category_id, :infomation, :price, :place, :score, :open_range, :external_page, :tag_list)
	end
end
