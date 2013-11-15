class Block < ActiveRecord::Base
	belongs_to :project
	has_many :resources
	has_one :template
end
