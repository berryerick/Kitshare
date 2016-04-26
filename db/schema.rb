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

ActiveRecord::Schema.define(version: 20160426171216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "item_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_comments", ["item_id"], name: "index_item_comments_on_item_id", using: :btree
  add_index "item_comments", ["user_id"], name: "index_item_comments_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.text     "description"
    t.integer  "times_copied"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "kit_comments", force: :cascade do |t|
    t.integer  "kit_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "kit_comments", ["kit_id"], name: "index_kit_comments_on_kit_id", using: :btree
  add_index "kit_comments", ["user_id"], name: "index_kit_comments_on_user_id", using: :btree

  create_table "kit_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "kit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "kit_items", ["item_id"], name: "index_kit_items_on_item_id", using: :btree
  add_index "kit_items", ["kit_id"], name: "index_kit_items_on_kit_id", using: :btree

  create_table "kits", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "kits", ["category_id"], name: "index_kits_on_category_id", using: :btree
  add_index "kits", ["user_id"], name: "index_kits_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "kit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["kit_id"], name: "index_likes_on_kit_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "kit_comments", "kits"
  add_foreign_key "kit_comments", "users"
  add_foreign_key "kit_items", "items"
  add_foreign_key "kit_items", "kits"
  add_foreign_key "kits", "categories"
  add_foreign_key "kits", "users"
  add_foreign_key "likes", "kits"
  add_foreign_key "likes", "users"
  add_foreign_key "sessions", "users"
end
