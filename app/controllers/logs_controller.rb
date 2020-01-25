class LogsController < ApplicationController
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

	private

	def log_params
	  params.require(:log).permit(:item_id, :image, :title, :body)
	end
end
