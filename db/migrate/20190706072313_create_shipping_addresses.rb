class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :name_first
      t.string :name_last
      t.string :name_first_phonetic
      t.string :name_last_phonetic
      t.string :post_code
      t.string :address
      t.string :phone
      t.integer :user_id
      t.boolean :is_delete, null: false, default: false
      t.timestamps
    end
  end
end
