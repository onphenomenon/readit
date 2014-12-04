# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141204011008) do

  create_table "comments", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "status",      limit: 1, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "comments_post_id_fk", using: :btree
  add_index "comments", ["status"], name: "index_comments_on_status", using: :btree
  add_index "comments", ["user_id"], name: "comments_user_id_fk", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["post_id"], name: "favorites_post_id_fk", using: :btree
  add_index "favorites", ["status"], name: "index_favorites_on_status", using: :btree
  add_index "favorites", ["user_id"], name: "favorites_user_id_fk", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "rank"
    t.integer  "status",      limit: 1, default: 0, null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "posts", ["status"], name: "index_posts_on_status", using: :btree
  add_index "posts", ["topic_id"], name: "posts_topic_id_fk", using: :btree
  add_index "posts", ["user_id"], name: "posts_user_id_fk", using: :btree

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "status",      limit: 1, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "topics", ["status"], name: "index_topics_on_status", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                  default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "status",                 limit: 1, default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "up"
    t.boolean  "down"
  end

  add_index "votes", ["post_id"], name: "votes_post_id_fk", using: :btree
  add_index "votes", ["status"], name: "index_votes_on_status", using: :btree
  add_index "votes", ["user_id"], name: "votes_user_id_fk", using: :btree

  add_foreign_key "comments", "posts", name: "comments_post_id_fk"
  add_foreign_key "comments", "users", name: "comments_user_id_fk"

  add_foreign_key "favorites", "posts", name: "favorites_post_id_fk"
  add_foreign_key "favorites", "users", name: "favorites_user_id_fk"

  add_foreign_key "posts", "topics", name: "posts_topic_id_fk"
  add_foreign_key "posts", "users", name: "posts_user_id_fk"

  add_foreign_key "votes", "posts", name: "votes_post_id_fk"
  add_foreign_key "votes", "users", name: "votes_user_id_fk"

end
