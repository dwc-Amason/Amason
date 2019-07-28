class Song < ApplicationRecord
	belongs_to :disc
	validates :name, presence: true
	validates :track, presence: true
end
