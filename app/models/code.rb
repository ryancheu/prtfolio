# Primary Author: psaylor
class Code < ActiveRecord::Base
  has_one :block, as: :resource

  validate :check_consistency
  #make sure there's either a gist id or content
  def check_consistency
    errors.add(:base, 'Need to specifiy a gist or code from github file!') if gist_id.blank? & content.blank?
  end

  # Returns the user who owns this Code
  def get_owner
    return self.block.get_owner
  end

end
