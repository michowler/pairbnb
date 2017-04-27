class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.references :user, foreign_key: true
    	t.string :title, null: false
    	t.text :description	
    	t.string :place_type, default: 0
    	t.integer :bedroom
    	t.integer :guest
    	t.integer :price, null: false
    	
    	t.timestamps
    end
  end
end
