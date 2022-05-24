class AddGiftCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_communities do |t|
      t.references :gift, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true

      t.timestamps                null: false
    end
    add_index :gift_communities, [:gift_id, :community_id], unique: true
  end
end
