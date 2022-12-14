class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all

    @sum = 0
    @cart_items.each do |cart_item|
      @sum += cart_item.sum_price
    end
    @total = @sum + postage

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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items

    if @order.save
      @cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.price = cart.item.price
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_done_path
    else
    @order = Order.new(order_params)
    render :new

    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    @sum = 0
    @order_details.each do |order_detail|
      @sum += order_detail.sum_price
    end
    @total = @sum + postage
  end

  def postage
    @postage = 800
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :postcode, :postage,:price,
  	                              :payment_method, :status,:created_at,
  	                              :customer_id, :item_id, :quantity)
  end
end