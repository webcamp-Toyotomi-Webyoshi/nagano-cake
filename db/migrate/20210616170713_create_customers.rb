class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :post_cord, null: false
      t.string :address, null: false
      t.string :telephone, null: false
      t.string :encrypted_password, null: false
      t.boolean :customer_status, default: false, null: false
      t.timestamps
    end
  end
end
