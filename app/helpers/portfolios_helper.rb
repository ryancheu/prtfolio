module PortfoliosHelper

	def get_project_languages user
		client = Octokit::Client.new :access_token => user.auth_token
		repos = client.repositories
		language_obj = {}
		repos.each do |repo|
		  if repo.language
		    if !language_obj[repo.language]
		      language_obj[repo.language] = 1
		    else
		      language_obj[repo.language] += 1
		    end
		  end
		end
		languages = []
		language_obj.each do |lang, count|
		  languages.push :language => lang, :count => count
		end
		return languages
    end

    def get_url(user,repo_name)
    	return "https://github.com/#{user}/#{repo_name}"
    end

    
    def get_user_location user
    	client = Octokit::Client.new :access_token => user.auth_token
    	user = client.user
		return client.user.location
    end

    def get_user_repos user
    	client = Octokit::Client.new :access_token => user.auth_token
		repos = client.repositories
		user_repos = []
		repos.each do |repo|
			url = get_url(repo.owner.login ,repo.name)
		  	user_repos.push :fork=> repo.fork, :language=>repo.language, :name=>repo.name, :url=>url
		end
		return user_repos
    end

    
    def get_project_byte_count_languages user
		client = Octokit::Client.new :access_token => user.auth_token
		repos = client.repositories
		repo_langs = []
		language_obj = {}
		language_byte_count = []
    	repos.each do |repo|
    		 if repo.language
		    	if !language_obj[repo.language]
		      		language_obj[repo.language] = 1
		    	else
		      		language_obj[repo.language] += 1
		    	end
		  	end
  			repo_name = repo.name
  			repo_langs = client.languages("#{repo.owner.login}/#{repo_name}")
  		end
  		repo_langs.each do |lang, count|
	  		if !language_obj[lang]
	    		language_obj[lang] = count
	  		else
	    		language_obj[lang] += count
	  		end
		end
		language_obj.each do |lang, count|
  			language_byte_count.push :name => "#{lang} (#{count})", :count => count
		end

		# some mandatory formatting for D3
		language_bytes = [ :name => "language_bytes", :elements => language_byte_count]
		return language_bytes
	end

end
