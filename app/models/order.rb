class Order < ApplicationRecord
	belongs_to :user
	has_many   :order_items

	accepts_nested_attributes_for :order_items, allow_destroy: true

	enum payment: { 代引:0, 銀行振込:1, クレジットカード:2 }

	def self.search(search)
      return Order.all unless search
      Order.where(['content LIKE ?', "%#{search}%"])
    end

end
