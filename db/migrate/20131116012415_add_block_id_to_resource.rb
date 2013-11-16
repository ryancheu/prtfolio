class AddBlockIdToResource < ActiveRecord::Migration
  def change
  	add_column :resources, :block_id, :integer
  end
end
