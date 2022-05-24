class CreateUserCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_communities do |t|
      t.references :user, null: false
      t.references :community, null: false
      t.timestamps
    end

    add_index :user_communities, [:user_id, :community_id], unique: true
  end
end
