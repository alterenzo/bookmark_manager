require 'bcrypt'

class User
	attr_reader :password
	attr_accessor :password_confirmation

	include DataMapper::Resource

	validates_format_of :email, as: :email_address
	validates_confirmation_of :password

	property :id, Serial
	property :email, String, format: :email_address, required: true, unique: true
	property :password_digest, String, length: 60

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end
