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

ActiveRecord::Schema.define(version: 20150705072852) do

  create_table "hero_match_ability_upgrades", force: :cascade do |t|
    t.integer  "hero_match_id"
    t.integer  "ability_id"
    t.integer  "level"
    t.integer  "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hero_matches", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "player_slot"
    t.integer  "item_0"
    t.integer  "item_1"
    t.integer  "item_2"
    t.integer  "item_3"
    t.integer  "item_4"
    t.integer  "item_5"
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "assists"
    t.integer  "leaver_status"
    t.integer  "gold"
    t.integer  "last_hits"
    t.integer  "denies"
    t.integer  "gpm"
    t.integer  "xpm"
    t.integer  "gold_spent"
    t.integer  "hero_damage"
    t.integer  "tower_damage"
    t.integer  "hero_healing"
    t.integer  "level"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "match_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.integer  "dota_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.integer  "main_attribute"
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
