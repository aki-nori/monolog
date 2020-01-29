class HomesController < ApplicationController
	before_action :authenticate_user!, except: [:about, :manage]
	before_action :authenticate_admin!, except: [:about, :top]

    def top
        @popular_items = Item.select('items.*', 'count(likes.id) AS liks').left_joins(:likes).group('items.id').order('liks desc').limit(8)
        @current_items = Item.all.order(created_at: "DESC").limit(8)
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
