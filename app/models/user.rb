require 'bcrypt'
require 'securerandom'

class User
	attr_reader :password
	attr_accessor :password_confirmation
  attr_accessor :password_token

	include DataMapper::Resource

	# validates_format_of :email, as: :email_address
	validates_confirmation_of :password

	property :id, Serial
	property :email, String, format: :email_address, required: true, unique: true
	property :password_digest, String, length: 60
  property :password_token, String, length: 60

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

  def generate_token
    self.password_token = SecureRandom.hex
    self.save
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
