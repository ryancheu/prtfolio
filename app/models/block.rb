class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :firstres, class_name: 'resource', polymorphic: true
  belongs_to :secondres, class_name: 'resource', polymorphic: true
  has_one :template

  # Returns the user who owns this block
  def get_owner
    return self.project.get_owner
  end

  # Returns the blocks resources in a hash that can be passed into its template 
  def get_resources_for_template

  end

end
