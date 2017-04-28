class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :tag_content, default: 0
      t.timestamps
    end
  end
end
