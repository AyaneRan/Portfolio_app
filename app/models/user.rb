class User < ApplicationRecord

  # authentication
  has_secure_password
    #validations
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: URI::MailTo::EMAIL_REGEXP },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: false
    
    before_save { self.email = email.downcase }

    # remember me
  attr_accessor :remember_token


  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    update!(remember_digest: BCrypt::Password.create(remember_token))
  end 

  def authenticated?(token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(token)
  end

  def forget
    update!(remember_digest: nil)
  end
  
  private
    self.email  = email.downcase
  end
end
