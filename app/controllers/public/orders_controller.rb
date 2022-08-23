class Public::OrdersController < ApplicationController

  def new
      @order = Order.new









  end

  def done










  end

  def comfirm










  end

  def create










  end

  def index










  end

  def show










  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :postcode, :postage, :price, :payment_method, :status, :created_at, :customer_id)
  end

end