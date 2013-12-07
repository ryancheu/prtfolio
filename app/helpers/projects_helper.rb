module ProjectsHelper

	def get_projects user
		client = Octokit::Client.new :access_token => user.auth_token
		repos = client.repositories
		repo_names = []
		language_obj = {}
		repos.each do |repo|
		  # sometimes language can be nil
			repo_names.push(repo.name)
		end
		return repo_names
    end

    # Returns true if the given string is neither nil nor empty
    # and thus can be shown in the view
    def can_show? str
    	return not(str.nil? || str === "")
    end
end
