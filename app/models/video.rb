# Primary Author: ryanc
class Video < ActiveRecord::Base
  has_one :block, as: :resource
end
