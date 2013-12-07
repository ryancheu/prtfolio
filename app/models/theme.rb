# Primary Author: anuhyag
class Theme < ActiveRecord::Base
	belongs_to :portfolio
	belongs_to :project
end
