class User < ActiveRecord::Base
  has_secure_password
  has_many :kit_comments, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :kits, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :session, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true;
  validates :password, length:{minimum: 8}
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

end
