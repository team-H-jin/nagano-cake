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

    @order = Order.new

    if params[:order][:selected_address] == "customer_address"
      @order.postcode = current_customer.postcode
      @order.name = current_customer.full_name
      @order.address = current_customer.address

    elsif params[:order][:selected_address] == "shopping_address"
      @address = ShoppingAddress.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:selected_address] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
       cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.price = cart.item.price
      order_detail.save
    end

    cart_items.destroy_all
    redirect_to orders_done_path
    else
    @order = Order.new(order_params)
    render :new

    end
  end

  def postage
    @postage = 800
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
  	                              :created_at, :customer_id, :item_id, :quantity, :selected_address)
  end

end