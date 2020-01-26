class HomesController < ApplicationController
    def top
        @popular_items = Item.select('items.*', 'count(likes.id) AS liks').left_joins(:likes).group('items.id').order('liks desc').limit(8)
        @current_items = Item.all.order(created_at: "DESC").limit(8)
    end

    def about

    end
end
