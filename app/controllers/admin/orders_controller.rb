class Admin::OrdersController < ApplicationController
      before_action :authenticate_admin!
 def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = OrderDetail.where(order_id: @order.id)
    @cart_items = Customer.find(params[:id]).cart_items.all
    @sum = 0
    @order_details.each do |order_detail|
      @sum += order_detail.sum_price
    end

    @total = @sum + postage
 end
 
 def postage
    @postage = 800
 end

 def update
     @order = Order.find(params[:id])
     if @order.update(order_params)
       if @order.status == "confirm_payment"
          @order.order_details.each do |order_detail|
          order_detail.update(status: "waiting_manufacture" )
          end
       end
       redirect_to admin_order_path
     else
       render :show
     end
 end
 
 private  
 
 def customer_params
    params.require(:customer).permit(:last_name,:first_name)
 end
 
 def order_params
    params.require(:order).permit(:name,:address,:payment_method,
                                  :status,:price,:customer_id,:created_at)
 end

    
end
