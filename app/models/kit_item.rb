class KitItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :kit
end
