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

ActiveRecord::Schema.define(version: 2019_05_10_101436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "life"
    t.integer "attack"
    t.integer "xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "fighter_1_id"
    t.bigint "fighter_2_id"
    t.bigint "fighter1_weapon_id"
    t.bigint "fighter2_weapon_id"
    t.integer "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter1_weapon_id"], name: "index_fights_on_fighter1_weapon_id"
    t.index ["fighter2_weapon_id"], name: "index_fights_on_fighter2_weapon_id"
    t.index ["fighter_1_id"], name: "index_fights_on_fighter_1_id"
    t.index ["fighter_2_id"], name: "index_fights_on_fighter_2_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack_bonus"
    t.integer "defense_bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
