class Notification < ApplicationRecord
  belongs_to :event, polymorphic: true
  belongs_to :notifying_user, class_name: 'User', foreign_key: 'notifying_user_id'
  belongs_to :notified_user, class_name: 'User', foreign_key: 'notified_user_id'
end
