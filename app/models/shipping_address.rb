class ShippingAddress < ApplicationRecord
	belongs_to :user

	def self.search(search)
      return Shipping_addresses.all unless search
      Shipping_addresses.where(['content LIKE ?', "%#{search}%"])
    end
end
