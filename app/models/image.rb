class Image < ActiveRecord::Base
  has_one :block, as: :resource
  
  has_attached_file :content, 
  :styles => {
    thumb: '100x100>'
  }

end
