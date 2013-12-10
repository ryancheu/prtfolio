class AddLanguageToCode < ActiveRecord::Migration
  def change
    add_column :codes, :language, :string
  end
end
