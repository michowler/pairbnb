class RemoveColumnFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :avatars, :json
  end
end
