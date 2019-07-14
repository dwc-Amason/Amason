class Item < ApplicationRecord
	has_many :discs
	has_many :cart_items

	belongs_to :label
	belongs_to :artist
	belongs_to :genre

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

    def self.search(search)
      return Item.all unless search
      Item.where(['content LIKE ?', "%#{search}%"])
    end




end
