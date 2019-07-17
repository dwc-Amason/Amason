class CartItemsController < ApplicationController
    def index
    @cart_items = current_user.cart_items
    end

    def create
    @cart_item = CartItem.new
    @cart_item.save
    end
end
