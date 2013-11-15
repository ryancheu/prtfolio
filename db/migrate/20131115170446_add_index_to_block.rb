class AddIndexToBlock < ActiveRecord::Migration
  def change
  	add_column :blocks, :page_index, :integer
  end
end
