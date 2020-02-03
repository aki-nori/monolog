class HomesController < ApplicationController
	before_action :authenticate_user!, except: [:about, :manage]
	before_action :authenticate_admin!, except: [:about, :top]

  def top
    if params[:search_type] == "like"
      @items = Item.select('items.*', 'count(likes.id) AS liks').left_joins(:likes).group('items.id').order('liks desc').page(params[:page]).per(12)
    elsif params[:search_type] == "recent"
      @items = Item.all.order(created_at: "DESC").page(params[:page]).per(12)
    elsif params[:search_type] == "log"
      @items = Item.select('items.*', 'count(logs.id) AS logs').left_joins(:logs).group('logs.id').order('logs desc').page(params[:page]).per(12)
    else
      @items = Item.all.page(params[:page]).per(12)
    end
  end

  def about
  end

  def manage
  	@users = User.all
  	@items = Item.all
  	@logs = Log.all
  	@categories = Category.all
  end
end
