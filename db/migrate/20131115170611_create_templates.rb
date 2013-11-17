class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.belongs_to :block
      
      t.timestamps
    end
  end
end
