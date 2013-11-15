class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	has_one :portfolio
	validates :fullname, presence: true, length: {maximum: 50}
	validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 10}
	validates :password, length: {minimum: 6}
    validates :email, presence: true, format: { with: /@/ }, uniqueness: {case_sensitive: false}
    has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
