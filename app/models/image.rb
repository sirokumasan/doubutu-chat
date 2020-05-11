class Image < ApplicationRecord
  belongs_to  :message,  optional: true
  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
