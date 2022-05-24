class Community < ApplicationRecord
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities, source: :user
  has_many :gifts, through: :gift_communities, source: :gift
end
