class Project < ActiveRecord::Base
	belongs_to :portfolio
	has_many :blocks
	has_one :theme
end
