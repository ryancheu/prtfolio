class AddPortfolioIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :portfolio_id, :integer
  end
end
