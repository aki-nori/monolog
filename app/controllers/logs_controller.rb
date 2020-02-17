class LogsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_log, only: [:edit, :update, :destroy]

	def create
		@log = Log.new(log_params)
		@log.from = :user
		@log.save
		redirect_back(fallback_location: top_path)
	end

	def edit
	end

	def update
		@log.update(log_params)
		redirect_to item_path(@log.item)
	end

	def destroy
		@item = @log.item
		@log.destroy
		redirect_to item_path(@item)
	end

	private

	def log_params
	  params.require(:log).permit(:item_id, :image, :title, :body)
	end

	def find_log
		@log = Log.find(params[:id])
	end

end