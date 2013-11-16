class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_one :portfolio

	validates :fullname, length: {maximum: 50}
	validates :username, presence: true
    validates :email, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	# Finds the user with the given uid, or if not found, creates a user with that uid and the given username and email (both required) and optional fullname. Returns the user object found or created.
	def User.find_by_uid_or_create(uid, email, username, fullname)
		user = User.where(:uid => uid).first_or_create!(fullname: fullname, email: email, username: username)
		return user
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
