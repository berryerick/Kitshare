class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
