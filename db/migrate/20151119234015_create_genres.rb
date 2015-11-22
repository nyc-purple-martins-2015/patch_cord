class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
