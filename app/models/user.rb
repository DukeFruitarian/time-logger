require 'digest/sha2'
class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_many :products
  
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  validate :password_validator
  
  def password=(password)
    @password = password
    generate_salt
    self.hashed_pass = User.encrypt_password(password, salt)
  end
  
  def User.encrypt_password(pass, salt)
    Digest::SHA2.hexdigest(pass + "smthg" + salt)
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  private :generate_salt
  
  def password_validator
    errors.add(:password,
      "should contain at least 3 symbols") unless password.length >= 3
    errors.add(:password,
      "should contain at least 1 alphabetical symbol") unless password =~ /[[:alpha:]]/
    errors.add(:password,
      "should contain at least 1 digit") unless password =~ /\d/
  end
  private :password_validator  
  
end
