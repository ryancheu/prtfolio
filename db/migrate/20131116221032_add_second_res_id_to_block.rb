class AddSecondResIdToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :secondres_id, :integer
  end
end
