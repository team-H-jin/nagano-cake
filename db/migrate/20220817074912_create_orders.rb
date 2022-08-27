class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :postage
      t.integer :price
      t.integer :payment_method
      t.integer :status, default: 0, null: false
      t.integer :customer_id

      t.timestamps
    end
  end
end
