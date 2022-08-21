class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { impossible_manufacture: 0, waiting_manufacture: 1, manufacturing: 2, finish: 3 }

  def add_tax_price
    (self.price * 1.10).round
  end

end
