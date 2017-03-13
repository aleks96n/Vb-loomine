class User < ActiveRecord::Base
  require 'securerandom'
  def validates_email?
    email.present? || provider.present?
  end

  def validates_password?
    password.present? || provider.present?
  end

  validates :name, presence: true, length: {maximum: 50}
  #validates :email,  length: {maximum: 255}, :if => :validates_email?
  has_secure_password
  validates :password, length: {minimum: 8}



  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid)
    user.name = auth_hash.info.name
    user.profile_image = auth_hash.info.image
    user.token = auth_hash.credentials.token
    #user.secret = auth_hash.credentials.secret
    user.password = SecureRandom.urlsafe_base64
    user.save!
    user
  end

end
