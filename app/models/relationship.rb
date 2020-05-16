class Relationship < ApplicationRecord
  # 規約： "モデル名_id" => Follower_id
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end