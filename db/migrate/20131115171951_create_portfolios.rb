class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.belongs_to :user
      t.string :font

      t.timestamps
    end
  end
end
