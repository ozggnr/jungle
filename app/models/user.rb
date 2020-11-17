class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, uniqueness: true,  confirmation: { case_sensitive: false }
  
  validates :password, length: {minimum: 6}
  
  def self.authenticate_with_credentials(email,password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end

