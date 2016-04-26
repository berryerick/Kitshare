class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :description
      t.float :price
      t.references :user, index: true, foreign_key: true
      t.integer :times_copied

      t.timestamps null: false
    end
  end
end
