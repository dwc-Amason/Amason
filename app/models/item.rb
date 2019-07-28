class Item < ApplicationRecord
	has_many :discs
	has_many :cart_items

	belongs_to :label
	belongs_to :artist
	belongs_to :genre

	enum status:[:"販売中", :"販売停止中"]

	attachment :image

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	validates :name, presence: true
	validates :price, presence: true, numericality: :only_integer
	validates :status, presence: true
	validates :stack, presence: true, numericality: :only_integer


end
