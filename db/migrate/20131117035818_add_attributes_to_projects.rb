class AddAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :text
    add_reference :projects, :image
  end
end
