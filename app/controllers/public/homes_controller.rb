class Public::HomesController < ApplicationController

    def top
        @items = Item.all.order(created_at: :desc).limit(5)
        @genres = Genre.all
    end
end
