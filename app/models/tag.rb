class Tag < ApplicationRecord
  belongs_to :message
  validates  :tag_name, presence: true
end
