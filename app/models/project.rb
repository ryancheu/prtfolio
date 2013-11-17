class Project < ActiveRecord::Base
	belongs_to :portfolio
    has_one :user, through: :portfolio
	has_many :blocks
	has_one :theme

    # Returns the user who owns this block
    def get_owner
        return self.user
    end

end
