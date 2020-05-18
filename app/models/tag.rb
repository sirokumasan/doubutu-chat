class Tag < ApplicationRecord
  has_many :messages
  validates :tag_name, presence: true
end
