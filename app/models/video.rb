# Primary Author: ryanc
class Video < ActiveRecord::Base
  has_one :block, as: :resource

  # set up the auto_html logic that will embed images
  auto_html_for :video do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    vimeo(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
