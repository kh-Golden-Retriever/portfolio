# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_25_110948) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gift_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_comments_on_gift_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "community_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "community_tokens", force: :cascade do |t|
    t.integer "community_id", null: false
    t.string "uuid", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_community_tokens_on_community_id"
  end

  create_table "done_deals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_done_deals_on_gift_id"
    t.index ["user_id"], name: "index_done_deals_on_user_id"
  end

  create_table "gift_communities", force: :cascade do |t|
    t.integer "gift_id", null: false
    t.integer "community_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_gift_communities_on_community_id"
    t.index ["gift_id", "community_id"], name: "index_gift_communities_on_gift_id_and_community_id", unique: true
    t.index ["gift_id"], name: "index_gift_communities_on_gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "description"
    t.text "how_to_give"
    t.integer "price"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "images"
    t.integer "community_id", null: false
    t.index ["community_id"], name: "index_gifts_on_community_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_likes_on_gift_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "notifying_user_id"
    t.integer "notified_user_id"
    t.string "event_type"
    t.integer "event_id"
    t.boolean "is_checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_type", "event_id"], name: "index_notifications_on_event_type_and_event_id"
    t.index ["notified_user_id"], name: "index_notifications_on_notified_user_id"
    t.index ["notifying_user_id"], name: "index_notifications_on_notifying_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_communities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "community_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_user_communities_on_community_id"
    t.index ["user_id", "community_id"], name: "index_user_communities_on_user_id_and_community_id", unique: true
    t.index ["user_id"], name: "index_user_communities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "comments", "gifts"
  add_foreign_key "comments", "users"
  add_foreign_key "communities", "users"
  add_foreign_key "done_deals", "gifts"
  add_foreign_key "done_deals", "users"
  add_foreign_key "gift_communities", "communities"
  add_foreign_key "gift_communities", "gifts"
  add_foreign_key "gifts", "communities"
  add_foreign_key "gifts", "users"
  add_foreign_key "likes", "gifts"
  add_foreign_key "likes", "users"
  add_foreign_key "notifications", "users", column: "notified_user_id"
  add_foreign_key "notifications", "users", column: "notifying_user_id"
  add_foreign_key "profiles", "users"
end
