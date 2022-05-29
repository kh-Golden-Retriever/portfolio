class DoneDeal < ApplicationRecord
  belongs_to :gift
  belongs_to :user

  validates :gift_id, uniqueness: true
end
