class GiftCommunity < ApplicationRecord
  belongs_to :gift
  belongs_to :community

  validates :gift_id, uniqueness: { scope: :community_id }
end
