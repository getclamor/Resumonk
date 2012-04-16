class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  
  
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, format: { with: valid_email_regex }
  validates :email, uniqueness: true
  validates :password, length: { within: 6..50 }
  
  before_save :create_remember_token, :create_username
  
  def to_param
    "#{id}-#{username.gsub(/[^a-z0-9]+/i, '-')}"
  end
    
  # associations
  has_many :resumes
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
    def create_username
      self.username = email.split('@')[0]
    end

end
