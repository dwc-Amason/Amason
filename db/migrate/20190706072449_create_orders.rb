class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	    t.string :name_first
	    t.string :name_last
	    t.string :name_first_phonetic
	    t.string :name_last_phonetic
	    t.string :post_code
	    t.string :address
	    t.string :phone
    	t.integer :total_price
    	t.integer :payment
    	t.integer :carriage
    	t.integer :shipping_status
    	t.integer :user_id
    	t.string :email
      t.timestamps
    end
  end
end
