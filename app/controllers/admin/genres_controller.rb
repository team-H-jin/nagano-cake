class Admin::GenresController < ApplicationController
    
 def new
    @genre = Genre.new  
 end
  
 def create
    genre = Genre.new(genere_params)
    genre.save
    render 
 end
    
end
