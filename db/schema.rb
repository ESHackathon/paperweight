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

ActiveRecord::Schema.define(version: 2018_04_24_132011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "publications", force: :cascade do |t|
    t.bigint "search_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "ris_hash"
    t.string "kind"
    t.string "publication_year"
    t.string "primary_title"
    t.string "secondary_title"
    t.string "start_page"
    t.string "end_page"
    t.string "volume_number"
    t.string "first_author"
    t.string "journal_name"
    t.string "issue_number"
    t.string "primary_date"
    t.string "abstract"
    t.index ["search_id"], name: "index_publications_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.text "ris"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "raw_keyword_response"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "publications", "searches"
end
