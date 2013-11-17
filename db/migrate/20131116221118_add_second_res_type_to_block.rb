class AddSecondResTypeToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :secondres_type, :string
  end
end
