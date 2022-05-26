class Like < ApplicationRecord
  has_many :notifications, as: :event, dependent: :destroy

  belongs_to :user
  belongs_to :gift

  validates_uniqueness_of :gift_id, scope: :user_id

  def notification_message(like)
    "#{like.gift.title}が#{like.user.name}お気に入り登録されました"
  end

  def notification_params_hash
    hash = {}
    hash[:path_model] = self.gift
    hash
  end
  
end
