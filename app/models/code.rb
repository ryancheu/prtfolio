class Code < ActiveRecord::Base
  has_one :block, as: :resource
end
