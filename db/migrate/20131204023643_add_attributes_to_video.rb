class AddAttributesToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :video, :string
  	add_column :videos, :video_html, :string
  end
end
