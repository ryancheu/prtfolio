# Primary Author: ryanc
class Image < ActiveRecord::Base
  has_one :block, as: :resource
  
  has_attached_file :content, 
  :styles => {
    thumb: '400x250#'
  }

  def partial_path
  	return "images/image"
  end

end
