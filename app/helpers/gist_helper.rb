# Primary Author: psaylor
module GistHelper

    # Returns a list of all gists created by the user
    # The format of the gist object (from Octokit) returned by this 
    # method is rather complex. 
    # Here is an example: http://hastebin.com/nodadijoxi.sm
    def get_gists user
      client = Octokit::Client.new :access_token => user.auth_token
      return client.gists
    end

    # Returns a list of gist ids for all gists created by the user
    def get_gist_ids user
      puts "Getting gists for user #{user.username}"
      gists = get_gists(user)
      gist_ids = gists.collect { |g| g[:id] }
      puts "Gists for user #{user.username}: gist_ids"
      return gist_ids
    end

    # Returns a list of hrefs for each gist created by the user
    def get_gist_hrefs user
      gists = get_gists_for_user(user)
      return gists.collect {|g| g.rels[:self].href }
    end
end
