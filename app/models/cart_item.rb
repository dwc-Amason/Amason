class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :user

    has_many :item, dependent: :destroy

	def add_good(good_id)

		current_item = item.find_by_good_id(good_id)

		if current_item
			current_item.quantity += 1
		else
			current_item = item.build(good_id: good_id)
		end
		current_item

    def total_price
    	items.to_a.sum{|item|item.total_price}
    end
end
end
