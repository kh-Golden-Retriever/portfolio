class Gift < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :title, presence: true

  enum status: {draft:0, display:1, undisplay:2, done_deal:3}
end
