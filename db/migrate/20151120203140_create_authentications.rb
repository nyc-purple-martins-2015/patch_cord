class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.references :user

      t.timestamps null: false
    end

    add_index :authentications, :user_id
  end
end
