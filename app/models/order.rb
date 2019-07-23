class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items

	#{ not_known:0, male: 1, female: 2, not_applicable: 9 }

	enum payment: { 代引:0, 銀行振込:1, クレジットカード:2 }

	def self.search(search)
      return Order.all unless search
      Order.where(['content LIKE ?', "%#{search}%"])
    end

end
