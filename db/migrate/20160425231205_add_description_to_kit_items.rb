class AddDescriptionToKitItems < ActiveRecord::Migration
  def change
    add_column :kit_items, :description, :text
  end
end
