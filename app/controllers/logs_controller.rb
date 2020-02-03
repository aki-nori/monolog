class LogsController < ApplicationController
	before_action :authenticate_user!

	def create
		log = Log.new(log_params)
		log.save
		redirect_back(fallback_location: top_path)
	end

	def edit
		@log = Log.find(params[:id])
	end

	def update
		log = Log.find(params[:id])
		log.update(log_params)
		redirect_to item_path(log.item)
	end

	def destroy
		log = Log.find(params[:id])
		item = log.item
		log.destroy
		redirect_to item_path(item)
	end

	private

	def log_params
	  params.require(:log).permit(:item_id, :image, :title, :body)
	end
end
