class CreateKitComments < ActiveRecord::Migration
  def change
    create_table :kit_comments do |t|
      t.references :kit, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
