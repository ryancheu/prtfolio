class AddFirstResTypeToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :firstres_type, :string
  end
end
