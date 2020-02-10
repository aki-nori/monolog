class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:update, :edit]

  def search
    @user = current_user
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(12)
  end

  def show
   @user = User.find(params[:id])
   @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = User.find(params[:id]).followings.page(params[:page]).per(12)
  end

  def followers
    @user = User.find(params[:id])
    @users = User.find(params[:id]).followers.page(params[:page]).per(12)
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image, :address, :twitter_account, :instagram_account, :facebook_account)
  end

  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
