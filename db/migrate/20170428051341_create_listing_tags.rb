class CreateListingTags < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_tags do |t|
    	t.references :listing, foreign_key: true
    	t.references :tag, foreign_key: true
      	t.timestamps
    end
    	add_index :tags, :tag_content
  end
end
