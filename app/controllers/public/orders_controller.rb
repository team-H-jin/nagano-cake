class Public::OrdersController < ApplicationController

  def new
      @order = Order.new









  end

  def done










  end

  def comfirm
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }









  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_done_path






  end

  def index
    @orders = current_customer.orders








  end

  def show
    # @order = Order.find(params[:id])









  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :postcode, :postage, :price, :payment_method, :status, :created_at, :customer_id)
  end

end