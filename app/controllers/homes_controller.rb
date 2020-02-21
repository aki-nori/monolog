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

    users = User.all
  	@users_count = users.count
    @recent_user_create = users.order(created_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")
    @recent_user_update = users.order(updated_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")

    categories = Category.all
    @categories_count = categories.count
    @recent_category_create = categories.order(created_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")
    @recent_category_update = categories.order(updated_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")

    items = Item.all
    @items_count = items.count
    @recent_item_create = items.order(created_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")
    @recent_item_update = items.order(updated_at: "DESC").first.created_at.strftime("%Y年%m月%d日 %H時%M分")
  end

end