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

ActiveRecord::Schema.define(version: 20140506153853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: true do |t|
    t.integer  "annual_cost"
    t.date     "start_date"
    t.date     "expiry_date"
    t.boolean  "renewable"
    t.string   "supplier"
    t.string   "owner"
    t.string   "owner_email"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "location"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "owner"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_email"
    t.integer  "transaction_volume"
  end

  create_table "stories", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "owner"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  add_index "stories", ["service_id"], name: "index_stories_on_service_id", using: :btree

  create_table "story_stages", force: true do |t|
    t.integer  "story_id"
    t.integer  "from_id"
    t.string   "from_type"
    t.integer  "to_id"
    t.string   "to_type"
    t.integer  "position"
    t.string   "payload"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_time"
  end

  add_index "story_stages", ["from_id", "from_type"], name: "index_story_stages_on_from_id_and_from_type", using: :btree
  add_index "story_stages", ["story_id"], name: "index_story_stages_on_story_id", using: :btree
  add_index "story_stages", ["to_id", "to_type"], name: "index_story_stages_on_to_id_and_to_type", using: :btree

  create_table "system_links", force: true do |t|
    t.integer  "system_a_id"
    t.integer  "system_b_id"
    t.string   "status"
    t.string   "envelope"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "system_links", ["system_a_id"], name: "index_system_links_on_system_a_id", using: :btree
  add_index "system_links", ["system_b_id"], name: "index_system_links_on_system_b_id", using: :btree

  create_table "systems", force: true do |t|
    t.string   "owner"
    t.string   "supplier"
    t.text     "technology"
    t.string   "status"
    t.string   "hosting"
    t.string   "impact_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.integer  "contract_id"
    t.string   "owner_email"
  end

  add_index "systems", ["contract_id"], name: "index_systems_on_contract_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "unverified"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
