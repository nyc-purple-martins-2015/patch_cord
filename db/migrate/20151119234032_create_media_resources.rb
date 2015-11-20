class CreateMediaResources < ActiveRecord::Migration
  def change
    create_table :media_resources do |t|

      t.timestamps null: false
    end
  end
end
