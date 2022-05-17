class Gift < ApplicationRecord
  enum status: {0:draft, 1:display, 2:undisplay, 3:done_deal}
end
