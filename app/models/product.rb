class Product < ApplicationRecord
    validates(:name, :description, :image, presence: true)
    validates(:price, numericality: {greater_than_or_equal_to:0.01})
    validates(:name, uniqueness: true)
    validates(:quantity, numericality: {greater_than_or_equal_to:1})
    has_one_attached :image
    has_many :cartitems

    before_destroy(:check_if_cart_is_empty) #true or false

    # only when items under that product is empty
    def check_if_cart_is_empty
      if self.cartitems.empty?
        return true
      else
        return false
      end
    end
end
