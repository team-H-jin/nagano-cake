class Public::GenresController < ApplicationController
    def show
     @genre = Genre.find(params[:id])
     @items = @genre.items.page(params[:page]).per(8)
     @genres = Genre.all
    end 
end
