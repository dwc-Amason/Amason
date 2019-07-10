class Order < ApplicationRecord
	belomgs_to :user
	has_many :order_items
end
