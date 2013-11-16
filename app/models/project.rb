class Project < ActiveRecord::Base
	belongs_to :portfolio
    has_one :user, through: :portfolio
	has_many :blocks
	has_one :theme

    def new_project_for_user user
        project = user.portfolio.projects.new
        return project
    end

    # Returns the user who owns this block
    def get_owner
        return self.user
    end

end
