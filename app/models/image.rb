class Image < ActiveRecord::Base
  has_one :block, as: :resource
end
