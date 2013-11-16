class AddContentToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :content
  end

  def self.down
    remove_attachment :images, :content
  end
end
