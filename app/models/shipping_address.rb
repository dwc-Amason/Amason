class ShippingAddress < ApplicationRecord
	belongs_to :user

	def self.search(search)
      return ShippingAddress.all unless search
      ShippingAddress.where(['content LIKE ?', "%#{search}%"])
    end
end
