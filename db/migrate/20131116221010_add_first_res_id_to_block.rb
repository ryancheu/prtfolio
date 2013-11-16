class AddFirstResIdToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :firstres_id, :integer
  end
end
