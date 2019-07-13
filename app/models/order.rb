class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items

	def self.search(search)
      return Order.all unless search
      Order.where(['content LIKE ?', "%#{search}%"])
    end

end
