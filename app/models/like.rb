class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gift

  validates_uniqueness_of :gift_id, scope: :user_id
end
