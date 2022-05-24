class AddColumnToGift < ActiveRecord::Migration[6.0]
  def change
    add_reference :gifts, :community, null: false, foreign_key: true
  end
end
