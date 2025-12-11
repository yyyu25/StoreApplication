class Cart < ApplicationRecord
  has_many :cartitems, dependent: :destroy
  belongs_to :user, optional: true

  #def add_item(pid)
  #end
  TAX_RATE = 0.09125
  DELIVERY_FEE = 9.99

  def subtotal
    cartitems.sum { |i| i.quantity * i.product.price }
  end

  def estimated_tax
    (subtotal * TAX_RATE).round(2)
  end

  def delivery_fee
    return 0 if cartitems.empty? 
    9.99
  end

  def total
    subtotal + estimated_tax + delivery_fee
  end

end
