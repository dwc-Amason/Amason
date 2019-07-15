class ShippingAddress < ApplicationRecord
	belongs_to :user

	def self.search(search)
      return Shipping_address.all unless search
      Shipping_address.where(['content LIKE ?', "%#{search}%"])
    end
end
