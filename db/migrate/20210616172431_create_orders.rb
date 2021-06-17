class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, default: 0, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :post_cord, null: false
      t.integer :order_status, default: 0, null: false

      t.timestamps
    end
  end
end
