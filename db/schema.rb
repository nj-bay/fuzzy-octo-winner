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

ActiveRecord::Schema.define(version: 20160611223539) do

  create_table "device_records", force: :cascade do |t|
    t.string   "serial_number"
    t.datetime "provisioned_at"
    t.datetime "activated_at"
    t.datetime "disassociated_at"
    t.integer  "merchant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "device_types", force: :cascade do |t|
    t.string   "device_type_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "device_event"
    t.string   "serial_number"
    t.integer  "device_type_id"
    t.integer  "merchant_id"
    t.datetime "timestamp"
  end

  create_table "merchant_types", force: :cascade do |t|
    t.string   "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.integer  "merchant_id"
    t.string   "merchant_plan_name"
    t.integer  "is_qsr"
    t.boolean  "is_demo"
    t.integer  "mcc_code"
    t.integer  "merchant_type_id"
    t.string   "clover_category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
