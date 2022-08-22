class ShoppingAddress < ApplicationRecord
  belongs_to :customer
  
  def new
  @address = ShoppingAddres 
  end 
  def address_display
  '〒' + postcode + ' ' + address + ' ' + name 
  end
end
