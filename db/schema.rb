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

ActiveRecord::Schema.define(version: 20150704211233) do

  create_table "heroes", force: :cascade do |t|
    t.integer  "dota_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  add_index "heroes", ["dota_id"], name: "index_heroes_on_dota_id"

  create_table "items", force: :cascade do |t|
    t.integer  "dota_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
    t.boolean  "secret_shop"
    t.boolean  "side_shop"
    t.boolean  "recipe"
  end

  add_index "items", ["dota_id"], name: "index_items_on_dota_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "dota_id"
    t.boolean  "radiant_win"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["dota_id"], name: "index_matches_on_dota_id"

end
