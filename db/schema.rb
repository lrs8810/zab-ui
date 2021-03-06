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

ActiveRecord::Schema.define(version: 2020_01_06_225048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "ynab_id"
    t.float "starting_total"
    t.float "interest_rate", default: 0.0
    t.float "min_payment", default: 0.0
    t.boolean "paid_off?", default: false
    t.string "name"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "snowball", default: 0.0
    t.string "payoff_date"
    t.integer "count", default: 0
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "accepted?"
    t.bigint "connected_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "access_token"
    t.string "refresh_token"
    t.string "last_login"
    t.boolean "reminders?", default: true
    t.float "monthly_payment", default: 0.0
    t.string "google_token"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "snowball_amount", default: 0
  end

end
