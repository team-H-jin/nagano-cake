class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @sum = 0
    @cart_items.each do |cart_item|
      @sum += cart_item.sum_price
    end
    @total = @sum + postage

    @order = Order.new(order_params)

    if params[:order][:selected_address] == "customer_address"
      @order.postcode = current_customer.postcode
      @order.name = current_customer.full_name
      @order.address = current_customer.address

    elsif params[:order][:selected_address] == "shopping_address"
      @address = ShoppingAddress.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name

    else params[:order][:selected_address] == "new_address"

    end
  end

  def create
    redirect_to orders_done_path
  end

  def postage
    postage = 800
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :postcode, :postage,
  	                              :price, :payment_method, :status,
  	                              :created_at, :customer_id, :item_id, :quantity)
  end
end