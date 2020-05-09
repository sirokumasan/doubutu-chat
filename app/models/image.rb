class Image < ApplicationRecord
  belongs_to  :message,  optional: true
  mount_uploader :image, ImageUploader
end
