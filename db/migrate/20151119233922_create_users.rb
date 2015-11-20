class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email
      t.string :password_digest, null: false
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone, null: false
      t.text :bio, limit: 350
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end
  end
end
