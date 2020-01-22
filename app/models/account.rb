class Account < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    # binding.pry
  end

  def self.authenticate(email, password)
    account = Account.find_by "email = ?", email
    # binding.pry
    if account && account.password_hash == BCrypt::Engine.hash_secret(password, account.password_salt)
      account
    else
      nil
    end
  end
end
