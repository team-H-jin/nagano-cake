class Admin::OrderDetailsController < ApplicationController
    
 def show
    @customer = Customer.find(params[:id])
 end
    
end
