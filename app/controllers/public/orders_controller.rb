class Public::OrdersController < ApplicationController

 def new
   @order = Order.new









 end

  def done










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