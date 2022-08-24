class Public::OrdersController < ApplicationController

 def new
   @order = Order.new









 end

  def done










  end

  def comfirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.gross }

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