require 'gravtastic'

class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates_uniqueness_of(:email, :message => "Someone already has this email, try another.")
  validates_uniqueness_of(:user_name, :message => "This user name is already taken.")

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

  def self.search(search)
    if search 
      find(:all, :conditions => ['first_name LIKE ?', "%#{search}"])
    end
  end

  include Gravtastic
  gravtastic

  has_many :tweets
  has_many :followings
  has_many :followers, :through => :followings
end
