class User < ApplicationRecord
  has_secure_password
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: URI::MailTo::EMAIL_REGEXP },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 } 

  attr_accessor :remember_token


  def remember
    self.remember_token = Secure.random.urlsafe_base64
    update!(remember_digest: BCrypt::Password.create(remember_token))
  end 

  def authenticated?(token)
     BCrypt::Password.new(remember_digest).is_password?(token)
  end

  def forget
    update!(remember_digest: nil)
  end
  has_secure_password
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: URI::MailTo::EMAIL_REGEXP },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 } 
end
