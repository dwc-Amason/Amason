class ShippingAddress < ApplicationRecord
	belongs_to :user

	def self.search(search)
      return ShippingAddress.all unless search
      ShippingAddress.where(['content LIKE ?', "%#{search}%"])
    end

    validates :name_first, presence: true
    validates :name_last, presence: true
    validates :name_first_phonetic, presence: true
    validates :name_last_phonetic, presence: true
    validates :post_code, presence: true, numericality: :only_integer
    validates :phone, presence: true, numericality: :only_integer
    validates :address, presence: true
end
