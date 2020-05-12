class Like < ApplicationRecord
  belongs_to :user  
  belongs_to :message, counter_caches :like_count
end
