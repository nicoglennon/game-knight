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

ActiveRecord::Schema.define(version: 20170721184320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favoritings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_favoritings_on_game_id"
    t.index ["user_id"], name: "index_favoritings_on_user_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_categories", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_game_categories_on_category_id"
    t.index ["game_id"], name: "index_game_categories_on_game_id"
  end

  create_table "game_mechanisms", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "mechanism_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_mechanisms_on_game_id"
    t.index ["mechanism_id"], name: "index_game_mechanisms_on_mechanism_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "number_of_players"
    t.integer "duration"
    t.string "release_date"
    t.string "designer"
    t.string "image_url"
    t.string "image_thumbnail_url"
    t.integer "bgg_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanisms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_ownerships_on_game_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "game_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.integer "user_id"
    t.integer "forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
