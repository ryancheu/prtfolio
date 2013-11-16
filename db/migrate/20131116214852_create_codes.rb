class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :content

      t.timestamps
    end
  end
end
