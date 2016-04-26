class User < ActiveRecord::Base
  has_secure_password
  has_many :kit_comments, :item_comments, :kits, :likes, dependant: :destroy
  has_many :items
  has_one :session, dependant: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :password, length:{minimum: 8}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

end
