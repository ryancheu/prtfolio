class RefactorTemplates < ActiveRecord::Migration
  def change
    drop_table :templates
    add_column :blocks, :template_id, :integer

  end
end
