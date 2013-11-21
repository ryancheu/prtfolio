# Primary Author: ryanc
class Description < ActiveRecord::Base
  has_one :block, as: :resource
end
