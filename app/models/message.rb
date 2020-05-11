class Message < ApplicationRecord
  belongs_to :user
  has_many   :images,  dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
