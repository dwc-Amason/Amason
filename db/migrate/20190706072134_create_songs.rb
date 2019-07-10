class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
    	t.string :name
    	t.integer :track
    	t.integer :disc_id
      t.timestamps
    end
  end
end
