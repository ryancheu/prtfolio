# Primary Author: ryanc
class Description < ActiveRecord::Base
  has_one :block, as: :resource

  def partial_path
  	return "descriptions/description"
  end

end
