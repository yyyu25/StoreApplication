class User < ApplicationRecord
  has_one :cart
  has_secure_password
  validates :email, uniqueness: true

  def admin?
    role == "admin"
  end
  
  def shopper?
    role == "shopper"
  end
  
end
