class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :baria_user, only: [:update, :edit]

  def search
    @user = current_user
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(12)
  end

  def show
    @items = @user.items.page(params[:page]).per(12)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  def followings
    @users = User.find(params[:id]).followings.page(params[:page]).per(12)
  end

  def followers
    @users = User.find(params[:id]).followers.page(params[:page]).per(12)
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image, :address, :twitter_account, :instagram_account, :facebook_account)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def baria_user
      redirect_to user_path(current_user) if params[:id].to_i != current_user.id
  end
end
