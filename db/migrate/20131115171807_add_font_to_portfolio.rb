class AddFontToPortfolio < ActiveRecord::Migration
  def change
  	add_column :portfolios, :font, :string
  end
end
