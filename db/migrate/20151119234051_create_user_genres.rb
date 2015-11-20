class CreateUserGenres < ActiveRecord::Migration
  def change
    create_table :user_genres do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false

      t.timestamps null: false
    end
  end
end
