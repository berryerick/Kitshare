class Item < ActiveRecord::Base
  belongs_to :user
  has_many :item_comments
  has_many :kits, through: :kit_items
  has_many :kit_items, dependent: :destroy

end
