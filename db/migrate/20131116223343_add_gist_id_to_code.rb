class AddGistIdToCode < ActiveRecord::Migration
  def change
    remove_column :codes, :content, :text
    add_column :codes, :gist_id, :string
  end
end
