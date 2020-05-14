class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable
  attr_accessor :remember_token
  has_secure_password validations: true
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :messages
  has_many :comments
  has_many :likes,  dependent: :destroy
  has_many :liked_messages, through: :likes, source: :message

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
