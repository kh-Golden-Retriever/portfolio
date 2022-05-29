class AddUniqueIndexToDoneDeals < ActiveRecord::Migration[6.0]
  def change
    remove_index :done_deals, :gift_id
    add_index :done_deals, :gift_id, unique: true
  end
end
