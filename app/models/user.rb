class User < ActiveRecord::Base
  require 'securerandom'
  before_save{ self.email = email.downcase}

  def validates_email?
    email.present? || provider.present?
  end

  def validates_password?
    password.present? || provider.present?
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}, format:{with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}



  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid)
    user.name = auth_hash.info.name
    user.email = auth_hash.info.email 
    user.profile_image = auth_hash.info.image
    user.token = auth_hash.credentials.token    #user.secret = auth_hash.credentials.secret
    user.password = SecureRandom.urlsafe_base64
    user.save!
    user
  end

end
