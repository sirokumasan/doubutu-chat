class Message < ApplicationRecord
  belongs_to :user
  has_many   :image, dependent: :destroy
end
