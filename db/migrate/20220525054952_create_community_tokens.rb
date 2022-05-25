class CreateCommunityTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :community_tokens do |t|
      t.references :community, null: false
      t.string :uuid, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
