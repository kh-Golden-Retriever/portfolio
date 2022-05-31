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

  enum status: { undisplay:0, display:1 }

  # left outer join なので0と1が同じ1としてカウントされている。
  scope :sort_by_comment_ct_asc, ->{ left_joins(:comments).group(:id).order('count(*) asc')}
  scope :sort_by_comment_ct_desc, ->{ left_joins(:comments).group(:id).order('count(*) desc')}
  scope :sort_by_like_ct_asc, ->{ left_joins(:likes).group(:id).order('count(*) asc')}
  scope :sort_by_like_ct_desc, ->{ left_joins(:likes).group(:id).order('count(*) desc')}
  
  scope :sort_by_done_deal_asc, ->{ includes(:done_deal).order('done_deals.created_at asc')}
  scope :sort_by_done_deal_desc, ->{ includes(:done_deal).order('done_deals.created_at desc')}

end
