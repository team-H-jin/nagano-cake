class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item


  def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
    self.item.add_tax_price*self.quantity
  end

end