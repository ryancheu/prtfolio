class Block < ActiveRecord::Base
  belongs_to :project
  belongs_to :firstres, class_name: 'resource', polymorphic: true
  belongs_to :secondres, class_name: 'resource', polymorphic: true
  has_one :template
end
