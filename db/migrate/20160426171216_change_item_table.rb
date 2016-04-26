class ChangeItemTable < ActiveRecord::Migration
  def change
    remove_column :items, :price
    remove_column :items, :user_id
  end
end
