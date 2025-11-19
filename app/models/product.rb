class Product < ApplicationRecord
    validates(:name, :description, :image, presence: true)
    validates(:price, numericality: {greater_than_or_equal_to:0.01})
    validates(:image, format: {with: %r{\.(gif|jpg|png)\Z}})
    validates(:name, uniqueness: true)
end
