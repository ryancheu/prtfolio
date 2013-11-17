class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.belongs_to :portfolio
      t.belongs_to :project
      
      t.timestamps
    end
  end
end
