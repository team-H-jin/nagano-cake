class Admin::OrdersController < ApplicationController
    
 def show
    @customer = Customer.find(params[:id])
    @order_details = Order_details.find(params[:id])
    @order = Order.find(params[:id])
    @order_items= Customer.find(params[:id]).order_items.all
    @total = @order_items.inject(0) { |sum, item| sum + item.sum_of_price }
 end
 
     private  
 
 def customer_params
    params.require(:customer).permit(:last_name,:first_name)
 end
 
 def order_detail_params
    params.require(:order_detail).permit(:status,:price,:quantity,:created_at,:order_id,:item_id)
 end   
 
 def order_params
    params.require(:order).permit(:name,:address,:payment_method,:status,:price,:customer_id)
 end

    
end
