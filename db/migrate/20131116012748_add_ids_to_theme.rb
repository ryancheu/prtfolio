class AddIdsToTheme < ActiveRecord::Migration
  def change
  	add_column :themes, :portfolio_id, :integer
  	add_column :themes, :project_id, :integer
  end
end
