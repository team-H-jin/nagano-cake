class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :postage
      t.integer :price
      t.string :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
