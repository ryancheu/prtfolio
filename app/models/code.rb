# Primary Author: psaylor
class Code < ActiveRecord::Base
  has_one :block, as: :resource

  validates :gist_id, presence: true

  # Returns the user who owns this Code
  def get_owner
    return self.block.get_owner
  end

end
