class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :item_quantity, null: false
      t.integer :production_status, default: 0, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
