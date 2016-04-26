class Kit < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :items, through: :kit_items
  has_many :kit_comments, dependent: :destroy
  has_many :kit_items, dependent: :destroy



end
