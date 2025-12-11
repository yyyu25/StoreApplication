class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_secure_password
  validates :email, uniqueness: true

  attr_accessor :card_number  


  def admin?
    role == "admin"
  end
  
  def shopper?
    role == "shopper"
  end

end
