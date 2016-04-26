class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
