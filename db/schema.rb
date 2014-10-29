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

ActiveRecord::Schema.define(version: 20141029075744) do

  create_table "levels", force: true do |t|
    t.integer  "number",        null: false
    t.integer  "next_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["next_level_id"], name: "index_levels_on_next_level_id", unique: true
  add_index "levels", ["number"], name: "index_levels_on_number", unique: true

  create_table "user_level_attempts", force: true do |t|
    t.integer  "score"
    t.integer  "user_level_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_level_attempts", ["user_level_id"], name: "index_user_level_attempts_on_user_level_id"

  create_table "user_levels", force: true do |t|
    t.integer  "high_score"
    t.integer  "user_id",    null: false
    t.integer  "level_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_levels", ["level_id"], name: "index_user_levels_on_level_id"
  add_index "user_levels", ["user_id"], name: "index_user_levels_on_user_id"

  create_table "users", force: true do |t|
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token_id"
    t.integer  "device_id"
  end

  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id", unique: true

end
