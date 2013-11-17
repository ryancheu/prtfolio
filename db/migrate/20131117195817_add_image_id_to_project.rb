class AddImageIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :image_id, :integer
  end
end
