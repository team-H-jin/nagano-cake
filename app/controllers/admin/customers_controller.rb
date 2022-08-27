class Admin::CustomersController < ApplicationController
     before_action :authenticate_admin!
 def index
    @customers = Customer.order("created_at DESC").page(params[:page]).per(5)
 end
 
 def show
    @customer = Customer.find(params[:id])
 end
 
 def edit
    @customer = Customer.find(params[:id])
 end     
    
 def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
 end
 
 private 

 def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:postcode,:phone_number,:email,:is_deleted)
 end
end
