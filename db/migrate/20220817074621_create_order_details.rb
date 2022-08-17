class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :status
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
