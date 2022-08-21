class Public::CartItemsController < ApplicationController
  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_item.save
  end
  
  def index
    @cart_items = CartItem.all
  end
  
private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end
end
