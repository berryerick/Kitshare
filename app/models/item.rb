class Item < ActiveRecord::Base
  belongs_to :user
  has_many :item_comments
  has_many :kits, through: :kit_items
  has_many :kit_items, dependent: :destroy
  has_attached_file :item_img
  validates_attachment_content_type :item_img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :item_name, :item_img, :description, presence: true
end
