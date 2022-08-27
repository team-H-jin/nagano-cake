
class Public::AddressesController < ApplicationController
      before_action :authenticate_customer!
  def index
    @shopping_address = ShoppingAddress.new
    @shopping_addresses = ShoppingAddress.all
  end

	def create
	  @shopping_address = ShoppingAddress.new(shopping_address_params)

      @shopping_address.save
      redirect_to addresses_path

	end

	def edit
    @shopping_address = ShoppingAddress.find(params[:id])
	end

	def update
	  @shopping_address = ShoppingAddress.find(params[:id])
	    @shopping_address.update(shopping_address_params)
	    redirect_to addresses_path
	end

	def destroy
	  @shopping_address = ShoppingAddress.find(params[:id])
	    @shopping_address.destroy
	    redirect_to addresses_path
	end


end