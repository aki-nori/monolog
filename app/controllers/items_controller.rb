class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :item_user, only: [:show, :edit, :update, :destroy]

	def search
		@user = current_user
		@q = Item.search(params[:q])
    @items = @q.result(distinct: true).page(params[:page]).per(12)
  end

	def show
		@user = @item.user
		@log = Log.new
		@logs = Log.where(item_id: @item.id)
		@comment = Comment.new
	end

	def new
		@item = Item.new
	end

	def confirm
		@item = Item.new(item_params)
		if @item.invalid?
			render :new
		end
	end

	def create
		@item = Item.new(item_params)
		if params[:back]
			render :new
		else
			if @item.save
				log = Log.create(item_id: @item.id, title: "#{@item.name} を登録しました", body: "これからこのガジェットのログを残していきましょう。", from: :system)
				redirect_to @item
			else
				render :new
			end
		end
	end

	def edit
	end

	def update
		@item.update(item_params)
		redirect_to @item
	end

	def destroy
		user = @item.user
		if @item.destroy
			redirect_to user
		else
			render :edit
		end
	end

	def like
		@user = User.find(params[:id])
		@items = User.find(params[:id]).liked_items.page(params[:page]).per(12)
	end

	private

	def item_params
	  params.require(:item).permit(:name, :user_id, :image, :category_id, :maker, :infomation, :price, :place, :score, :open_range, :external_page)
	end

	def item_user
		@item = Item.find(params[:id])
	end
end