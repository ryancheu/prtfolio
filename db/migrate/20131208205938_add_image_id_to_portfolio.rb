class AddImageIdToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :image_id, :integer
  end
end
