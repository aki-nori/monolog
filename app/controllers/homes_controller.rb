class HomesController < ApplicationController
    def top
        @items = Item.limit(6)
    end

    def about
        
    end
end
