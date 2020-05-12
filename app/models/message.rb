class Message < ApplicationRecord
  belongs_to :user
  has_many   :images,  dependent: :destroy
  has_many   :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :content, presence: true
end
