class AddContentToCode < ActiveRecord::Migration
  def change
    add_column :codes, :content, :text
  end
end
