class Gift < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 取引の情報なのでデストロイしないようにする
  has_one :done_deal
  has_one :gifted_user, through: :done_deal, source: :user

  has_many :gift_communities, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  validates :how_to_give, length: { maximum: 65_535 }
  validates :price, numericality: { less_than_or_equal_to: 999999 }, allow_blank: true

  enum status: { draft:0, display:1, undisplay:2 }

end
