class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	has_many :cart_items
	has_many :orders
	has_many :shipping_addresses

    acts_as_paranoid

	validates :name_first, presence: true
	validates :name_last, presence: true
	validates :name_first_phonetic, presence: true
	validates :name_last_phonetic, presence: true
	validates :post_code, presence: true, numericality: :only_integer
	validates :phone, presence: true, numericality: :only_integer
	validates :address, presence: true

end
