class Tag < ApplicationRecord
  has_many :message_tags
  has_many :messages,  through: :message_tags
  validates  :tag_name, presence: true
end
