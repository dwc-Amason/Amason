class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :name
    	t.integer :price
    	t.integer :status
    	t.integer :stack
    	t.string :image_id
    	t.integer :artist_id
    	t.integer :genre_id
    	t.integer :label_id
      t.timestamps
    end
  end
end
