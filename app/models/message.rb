class Message < ApplicationRecord
  belongs_to :user
  has_many   :images,           dependent: :destroy
  has_many   :comments
  has_many   :likes,            dependent: :destroy
  has_many   :liked_users,      through: :likes, source: :user
  has_many   :message_tags,     dependent: :destroy
  has_many   :tags,             through: :message_tags
  
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tags,   allow_destroy: true
  validates :content, presence: true
  is_impressionable counter_cache: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def rnking  
    Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
  end

end
