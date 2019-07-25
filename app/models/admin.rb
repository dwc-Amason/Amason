class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def self.search(search)
      return User.all unless search
      User.where(['name_first LIKE ?', "%#{search}%"]) +
      User.where(['name_last LIKE ?', "%#{search}%"])
    end
end
