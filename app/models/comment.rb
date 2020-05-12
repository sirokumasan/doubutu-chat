class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  validates :text, presence: true
end
