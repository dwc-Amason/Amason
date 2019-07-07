class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :name_first
      t.string :name_last
      t.string :name_first_phonetic
      t.string :name_last_phonetic
      t.integer :post_code
      t.string :address
      t.integer :phone
      t.integer :user_id
      t.boolean :delete_flag, null: false, default: false
      t.timestamps
    end
  end
end
