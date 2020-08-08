# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_130744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "basses", force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.string "name"
    t.integer "year"
    t.integer "string_num"
    t.boolean "fretless", default: false
    t.boolean "active", default: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_basses_on_manufacturer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "bass_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bass_id"], name: "index_comments_on_bass_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "album"
    t.bigint "genre_id", null: false
    t.bigint "bass_id", null: false
    t.bigint "artist_id", null: false
    t.string "youtube_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "year"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["bass_id"], name: "index_songs_on_bass_id"
    t.index ["genre_id"], name: "index_songs_on_genre_id"
  end

  add_foreign_key "basses", "manufacturers"
  add_foreign_key "comments", "basses"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "basses"
  add_foreign_key "songs", "genres"
end
