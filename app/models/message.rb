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
  validates :content, presence: true, length: {maximum: 40} 
  is_impressionable counter_cache: true
  validates_associated :images
  validates :images, presence: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def rnking  
    Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
  end

  def save_messages(tag)
    current_tag = Tag.pluck(:tag_name) unless self.tags.nil?
    old_tag = current_tag - tag
    new_tag = tag - current_tag

    old_tag.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    new_tag.each do |new_name|
      message_tag = Tag.find_or_create_by(tag_name: new_name )
      self.tags << message_tag
    end
  end

end
