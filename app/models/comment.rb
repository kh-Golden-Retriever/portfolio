class Comment < ApplicationRecord
  has_many :notifications, as: :event, dependent: :destroy

  belongs_to :user
  belongs_to :gift

  validates :content, presence: true, length: { maximum: 65_535 }

  def notification_message(comment)
    "#{comment.gift.title}に#{comment.user.name}がコメントしました"
  end

  def notification_params_hash
    hash = {}
    hash[:path_model] = self.gift
    hash
  end
end
