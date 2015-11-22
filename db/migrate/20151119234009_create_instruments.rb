class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
