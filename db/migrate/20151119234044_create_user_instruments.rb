class CreateUserInstruments < ActiveRecord::Migration
  def change
    create_table :user_instruments do |t|
      t.integer :user_id, null: false
      t.integer :instrument_id, null: false

      t.timestamps null: false
    end
  end
end
