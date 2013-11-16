class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_one :portfolio

	validates :fullname, length: {maximum: 50}
	validates :username, presence: true
    validates :email, presence: true
    validates :uid, presence: true
    validates :auth_token, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	# Finds the user with the given uid, or if not found, creates a user with 
	# the given user_params hash. Username, email, and auth_token required 
	# in the hash; fullname optional. Returns the user object found or created.
	def User.find_by_uid_or_create(uid, user_params)
		user = User.where(:uid => uid).first_or_create!(user_params)
		user.update_attributes(user_params)
		return user
	end


	# Returns a list of gist ids for all gists created by the given user
	def get_gist_ids_for_user user
		puts "Getting gists for user #{user.nickname}"
		gists = get_gists_for_user(user)
		gist_ids = gists.collect { |g| g[:id] }
		puts "Gists for user #{user.nickname}: gist_ids"
		return gist_ids
	end


	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		# Returns a list of all gists created by the given user
		# The format of the gist object (from Octokit) returned by this 
		# method is rather complex. 
		# Here is an example: http://hastebin.com/nodadijoxi.sm
		def get_gists_for_user user
	        client = Octokit::Client.new :access_token => user.auth_token
	        return client.gists
	    end

	    # Returns a list of hrefs for each gist created by the given user
	    def get_gist_hrefs_for_user user
	    	gists = get_gists_for_user(user)
	    	return gists.collect {|g| g.rels[:self].href }
	    end
end
