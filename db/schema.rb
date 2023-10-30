# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_30_105511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.integer "duration"
    t.bigint "caller_id", null: false
    t.bigint "random_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["caller_id"], name: "index_calls_on_caller_id"
    t.index ["random_user_id"], name: "index_calls_on_random_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "friend_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_chatrooms_on_friend_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_1_id", null: false
    t.bigint "user_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_friends_on_user_1_id"
    t.index ["user_2_id"], name: "index_friends_on_user_2_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chatroom_id", null: false
    t.bigint "sender_id", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "reviewer_id"
    t.bigint "reviewee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "translations", force: :cascade do |t|
    t.string "primary_language_word"
    t.string "target_language_word"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_flashcards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.integer "success_count", default: 0
    t.integer "failed_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "translation_id", null: false
    t.index ["category_id"], name: "index_user_flashcards_on_category_id"
    t.index ["translation_id"], name: "index_user_flashcards_on_translation_id"
    t.index ["user_id"], name: "index_user_flashcards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calls", "users", column: "caller_id"
  add_foreign_key "calls", "users", column: "random_user_id"
  add_foreign_key "chatrooms", "friends"
  add_foreign_key "friends", "users", column: "user_1_id"
  add_foreign_key "friends", "users", column: "user_2_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "user_flashcards", "categories"
  add_foreign_key "user_flashcards", "translations"
  add_foreign_key "user_flashcards", "users"
end
