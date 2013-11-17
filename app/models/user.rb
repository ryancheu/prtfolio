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

	# Returns a new Project object for the user
	def new_project
		project = self.portfolio.projects.new
		return project
	end

	# Returns a new Portfolio object for the user
	def new_portfolio
		portfolio = Portfolio.new(user: self)
		return portfolio
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
