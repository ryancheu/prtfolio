class AddProjectIdToBlock < ActiveRecord::Migration
  def change
  	add_column :blocks, :project_id, :integer

  end
end
