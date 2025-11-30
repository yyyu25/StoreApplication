class User < ApplicationRecord
  has_one :cart
  has_secure_password
  validates :email, uniqueness: true
end
