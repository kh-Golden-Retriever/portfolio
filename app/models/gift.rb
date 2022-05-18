class Gift < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  validates :how_to_give, length: { maximum: 65_535 }
  validates :price, numericality: { less_than_or_equal_to: 999999 }

  enum status: {draft:0, display:1, undisplay:2, done_deal:3}
end
