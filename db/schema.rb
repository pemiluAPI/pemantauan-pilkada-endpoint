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

ActiveRecord::Schema.define(version: 20151126022855) do

  create_table "monitoring_organizations", primary_key: "id_monitoring", force: true do |t|
    t.string   "monitoring_name",                  null: false
    t.string   "leader_name"
    t.text     "address"
    t.string   "monitoring_counter", default: "0", null: false
    t.string   "accreditation_num",                null: false
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monitoring_organizations", ["region_id"], name: "index_monitoring_organizations_on_region_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name",       null: false
    t.string   "kind",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
