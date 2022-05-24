class CreateTablesExceptUser < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.timestamps                null: false
    end

    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :community_code

      t.timestamps                null: false
    end

    create_table :gifts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.text :how_to_give
      t.integer :price
      t.integer :status, null: false, default: 0

      t.timestamps                null: false
    end
  
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true
      t.text :content

      t.timestamps                null: false
    end
  
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true

      t.timestamps                null: false
    end
  
    create_table :done_deals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true

      t.timestamps                null: false
    end
  end
end
