class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :portfolio

      t.timestamps
    end
  end
end
