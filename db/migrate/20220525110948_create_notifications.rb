class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :notifying_user, foreign_key: { to_table: :users }
      t.references :notified_user, foreign_key: { to_table: :users }
      t.references :event, polymorphic: true
      t.boolean :is_checked, default: false, null: false

      t.timestamps
    end
  end
end
