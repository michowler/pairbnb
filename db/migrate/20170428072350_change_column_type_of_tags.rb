class ChangeColumnTypeOfTags < ActiveRecord::Migration[5.0]
  def change
  	change_column :tags, :tag_content, :string
  end
end
