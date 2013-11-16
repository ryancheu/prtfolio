class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :page_index
      t.belongs_to :project

      t.timestamps
    end
  end
end
