class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_uniqueness_of(:email)
  validates_uniqueness_of(:user_name)

  validates_presence_of(:first_name)
  validates_presence_of(:last_name)
  validates_presence_of(:state)
  validates_presence_of(:city)
  validates_presence_of(:bio)
  validates_presence_of(:password)

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

    end
  end



  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  has_many :tweets
  has_many :followings
  has_many :followers, :through => :followings
end
