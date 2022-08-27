class Public::CartItemsController < ApplicationController
      before_action :authenticate_customer!
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
    @sum += cart_item.sum_price
    end
    # @sum = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @customer = current_customer
    @cart_item = CartItem.where(customer_id:@customer)
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end



private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:quantity,:customer_id)
  end

end
