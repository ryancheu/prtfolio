# Primary Author: psaylor
class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :firstres, class_name: 'resource', polymorphic: true
  belongs_to :secondres, class_name: 'resource', polymorphic: true
  has_one :template

  validates :template_id, presence: true
  validates :firstres, presence: true

  # Returns the user who owns this block
  def get_owner
    return self.project.get_owner
  end
  
end
