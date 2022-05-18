class Gift < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true

  enum status: {draft:0, display:1, undisplay:2, done_deal:3}
end
