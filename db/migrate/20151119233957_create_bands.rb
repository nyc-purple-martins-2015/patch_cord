class CreateBands < ActiveRecord::Migration
  def change
     create_table :bands do |t|
      t.string :name, null: false
      t.text :bio, limit: 350
      t.integer :admin_id, null: false
      #latitude, longitude

      t.timestamps null: false
    end
  end
end

