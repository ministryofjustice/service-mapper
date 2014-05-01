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

ActiveRecord::Schema.define(version: 20140501101328) do

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
    t.string   "role"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "owner"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

end
