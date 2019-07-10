class Item < ApplicationRecord
	has_many :discs
	has_many :cart_items

	belongs_to :label
	belongs_to :artist
	belongs_to :genre
end
