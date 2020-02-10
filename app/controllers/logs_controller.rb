class LogsController < ApplicationController
	before_action :authenticate_user!

	def create
		@log = Log.new(log_params)
		@log.from = :user
		if @log.save
			redirect_back(fallback_location: top_path)
		else
			render item_path(@log.item)
		end
	end

	def edit
		@log = Log.find(params[:id])
	end

	def update
		@log = Log.find(params[:id])
		if @log.update(log_params)
			redirect_to item_path(@log.item)
		else
			render item_path(log.item)
		end
	end

	def destroy
		@log = Log.find(params[:id])
		item = @log.item
		if @log.destroy
			redirect_to item_path(item)
		else
			render item_path(item)
		end
	end

	private

	def log_params
	  params.require(:log).permit(:item_id, :image, :title, :body)
	end
end
