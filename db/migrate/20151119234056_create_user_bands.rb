class CreateUserBands < ActiveRecord::Migration
  def change
    create_table :user_bands do |t|
      t.integer :user_id, null: false
      t.integer :band_id, null: false

      t.timestamps null: false
    end
  end
end
