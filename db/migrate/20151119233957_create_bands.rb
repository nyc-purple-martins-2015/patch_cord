class CreateBands < ActiveRecord::Migration
  def change
     create_table :bands do |t|
      t.string :name, null: false
      t.text :bio, limit: 350
      t.integer :admin_id, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end

