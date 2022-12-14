class Admin::ItemsController < ApplicationController
      before_action :authenticate_admin!
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @genres = Genre.all
      @item.update(item_params)
      redirect_to admin_item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private

    def item_params
      params.require(:item).permit(:name, :introduction, :price, :status, :image ,:genre_id)
    end

end