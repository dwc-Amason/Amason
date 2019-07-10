class CartItem < ApplicationRecord
	belomgs_to :item
	belomgs_to :user

end
