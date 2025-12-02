class Order < ApplicationRecord
  belongs_to :user
  has_many :orderitems, dependent: :destroy
end
