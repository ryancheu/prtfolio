class AddLinkToCode < ActiveRecord::Migration
  def change
    add_column :codes, :link, :string
  end
end
