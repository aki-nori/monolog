class HomesController < ApplicationController

  def top
    authenticate_user!
    if params[:search_type] == "like"
      @items = Item.select('items.*', 'count(likes.id) AS liks').left_joins(:likes).group('items.id').order('liks desc').page(params[:page]).per(12)
    elsif params[:search_type] == "recent"
      @items = Item.all.order(created_at: "DESC").page(params[:page]).per(12)
    elsif params[:search_type] == "log"
      @items = Item.select('items.*', 'count(logs.id) AS logs').left_joins(:logs).group('items.id').order('logs desc').page(params[:page]).per(12)
    else
      @items = Item.all.page(params[:page]).per(12)
    end
  end

  def about
  end

  def manage
    authenticate_admin!
  	@users = User.all
  	@items = Item.all
  	@logs = Log.all
  	@categories = Category.all
  end
end