class CreateBandGenres < ActiveRecord::Migration
  def change
    create_table :band_genres do |t|
      t.integer :band_id, null: false
      t.integer :genre_id, null: false

      t.timestamps null: false
    end
  end
end
