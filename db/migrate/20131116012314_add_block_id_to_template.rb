class AddBlockIdToTemplate < ActiveRecord::Migration
  def change
  	add_column :templates, :block_id, :integer

  end
end
