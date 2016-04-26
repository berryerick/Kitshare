class CreateKitItems < ActiveRecord::Migration
  def change
    create_table :kit_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :kit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
