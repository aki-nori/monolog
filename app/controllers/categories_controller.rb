class CategoriesController < ApplicationController
	before_action :authenticate_admin!

	def index
		@category = Category.new
		@categories = Category.all
	end

	def create
		category = Category.new(category_params)
		category.save
		redirect_to categories_path
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
	end

	def update
		category = Category.find(params[:id])
		category.update(category_params)
		redirect_to categories_path
	end

	def destroy
	end

	private

	def category_params
	  params.require(:category).permit(:name)
	end
end
