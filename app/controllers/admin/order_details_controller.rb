class Admin::OrderDetailsController < ApplicationController
    
 def show
    @customer = Customer.find(params[:id])
    @order_details = Order_details.find(params[:id])
 end
    
 private  
 
 def order_detail_params
    params.require(:order_detail).permit(:last_name,:first_name,)
 end   
end
