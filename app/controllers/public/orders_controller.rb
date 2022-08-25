class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
 end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
    @sum += cart_item.sum_price
    end
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name


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
    redirect_to　orders_done_path
    else
    @order = Order.new(order_params)
    render :new

    end
  end

  def index











  end

  def show











    @order = Order.find(params[:id])
    @order.order_details

    @subtotal=
      @sum = 0
      @order.order_details.each do |order_detail|
      @sum += detail.quantity * order_detail.price
      end

    @total = @subtotal += 800
  end

  def show
    @order = Order.find(params[:id])
    @order.order_details

    @subtotal=
      @sum = 0
      @order.order_details.each do |order_detail|
      @sum += detail.quantity * order_detail.price
      end

    @total = @subtotal += 800
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :postcode, :postage, :price, :payment_method, :status, :created_at, :customer_id)
  end
end