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

ActiveRecord::Schema.define(version: 20140723162634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_memberships", force: true do |t|
    t.integer  "group_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id", using: :btree
  add_index "group_memberships", ["story_id"], name: "index_group_memberships_on_story_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "contact_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.integer  "replaces_story_id"
    t.integer  "story_stages_count", default: 0, null: false
    t.string   "contact_email"
    t.string   "contact_team"
  end

  add_index "stories", ["replaces_story_id"], name: "index_stories_on_replaces_story_id", using: :btree
  add_index "stories", ["service_id"], name: "index_stories_on_service_id", using: :btree

  create_table "story_links", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "story_links", ["from_id"], name: "index_story_links_on_from_id", using: :btree
  add_index "story_links", ["to_id"], name: "index_story_links_on_to_id", using: :btree

  create_table "story_stages", force: true do |t|
    t.integer  "story_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "position"
    t.string   "payload"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_time"
  end

  add_index "story_stages", ["story_id"], name: "index_story_stages_on_story_id", using: :btree

  create_table "systems", force: true do |t|
    t.string   "owner"
    t.string   "supplier"
    t.text     "technology"
    t.string   "status"
    t.string   "hosting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "owner_email"
    t.string   "network"
    t.boolean  "decommissioning"
    t.string   "source_code_url"
    t.string   "technical_support_contact"
    t.string   "link"
    t.string   "role"
    t.string   "location"
    t.string   "type"
  end

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

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
