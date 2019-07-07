class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	    t.string :name_first
	    t.string :name_last
	    t.string :name_first_phonetic
	    t.string :name_last_phonetic
	    t.integer :post_code
	    t.string :address
	    t.integer :phone
    	t.integer :total_price
    	t.string :payment
    	t.integer :carriage
    	t.integer :cart_id
      t.timestamps
    end
  end
end
