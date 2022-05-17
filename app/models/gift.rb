class Gift < ApplicationRecord
  enum status: {draft:0, display:1, undisplay:2, done_deal:3}
end
