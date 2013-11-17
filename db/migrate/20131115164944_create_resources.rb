class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.belongs_to :block
      
      t.timestamps
    end
  end
end
