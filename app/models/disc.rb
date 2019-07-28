class Disc < ApplicationRecord
	belongs_to :item
	has_many :songs

	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
	validates :name, presence: true
end
