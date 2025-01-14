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

ActiveRecord::Schema.define(version: 2023_02_03_163320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "viewing_party_id"
    t.boolean "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invitees_on_user_id"
    t.index ["viewing_party_id"], name: "index_invitees_on_viewing_party_id"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "api_id"
    t.string "image_url"
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewing_parties", force: :cascade do |t|
    t.integer "duration"
    t.string "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.integer "movie_id"
  end

  add_foreign_key "invitees", "users"
  add_foreign_key "invitees", "viewing_parties"
end
