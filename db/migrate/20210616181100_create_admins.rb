class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.text :email, null: false
      t.text :encrypted_password, null: false

      t.timestamps
    end
  end
end
