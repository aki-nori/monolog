class UsersController < ApplicationController
  before_action :baria_user, only: [:update, :edit]

  def show
   @user = User.find(params[:id])
   @items = @user.items
  end

  def index
  end

  def edit
  @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def followings
    @users = User.find(params[:id]).followings
  end

  def followers
    @users = User.find(params[:id]).followers
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image, :address)
  end

  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
