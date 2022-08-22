class ShoppingAddress < ApplicationRecord
  belongs_to :customer
  
  def new
  @address = ShoppingAddres
  end 
  
end
def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end