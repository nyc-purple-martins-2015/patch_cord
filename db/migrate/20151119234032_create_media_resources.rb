class CreateMediaResources < ActiveRecord::Migration
  def change
    create_table :media_resources do |t|
      t.string :media_type
      t.text :content
      t.string :link
      t.references :showable, :polymorphic => true
      t.timestamps null: false
    end
  end
end
