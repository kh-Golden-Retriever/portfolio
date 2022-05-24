class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gift

  validates :content, presence: true, length: { maximum: 65_535 }
end
