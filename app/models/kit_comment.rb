class KitComment < ActiveRecord::Base
  belongs_to :kit
  belongs_to :user
end
