class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable
  attr_accessor :remember_token
  has_secure_password validations: true
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}, allow_nil: true
  has_many :messages
  has_many :comments
  has_many :likes,  dependent: :destroy
  has_many :liked_messages, through: :likes, source: :message
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy

   # 渡された文字列のハッシュ値を返す
   def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                            BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #永続セッションのためにユーザーをデータベースに記憶する。
  def remember
    self.remember_token = User.new_token
    self.update_attribute(:remember_digest, User.digest(remember_token))
  end

  #渡されたトークンがダイジェストに一致したらtrueを返す

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザのログイン情報を破棄する
  def forget
    self.update_attribute(:remember_digest, nil)
  end

end
