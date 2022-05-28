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

ActiveRecord::Schema[7.0].define(version: 2022_05_28_071519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "strava_id"
    t.string "name"
    t.integer "distance"
    t.string "moving_time"
    t.string "elapsed_time"
    t.decimal "total_elevation_gain", precision: 10
    t.decimal "elev_high", precision: 10
    t.decimal "elev_low", precision: 10
    t.decimal "average_speed", precision: 10
    t.decimal "max_speed", precision: 10
    t.string "start_date"
    t.boolean "public", default: true
  end

  create_table "mobility_network_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "strava_athlete_id"
    t.string "email_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "mobility_network_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobility_network_user_id"], name: "index_team_members_on_mobility_network_user_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
