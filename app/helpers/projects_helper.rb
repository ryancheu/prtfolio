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

    def section_color_hex index
        hex_colors = ["#343838", "#ecf0f1"]
        return hex_colors[index%2]
    end

    def section_color index
        colors = ['dark-gray', 'gray']
        return colors[index%2]
    end
end
