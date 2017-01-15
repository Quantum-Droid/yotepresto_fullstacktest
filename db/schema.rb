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

ActiveRecord::Schema.define(version: 20170114203948) do

  create_table "personal_references", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "second_name",       limit: 255
    t.string   "first_last_name",   limit: 255
    t.string   "second_last_name",  limit: 255
    t.string   "cell_phone_number", limit: 255
    t.integer  "requisition_id",    limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "personal_references", ["requisition_id"], name: "index_personal_references_on_requisition_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "second_name",      limit: 255
    t.string   "first_last_name",  limit: 255
    t.string   "second_last_name", limit: 255
    t.string   "birth_date",       limit: 255
    t.string   "curp",             limit: 255
    t.string   "rfc",              limit: 255
    t.string   "gender",           limit: 255
    t.string   "birth_state",      limit: 255
    t.string   "phone_number",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",          limit: 4
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "requisitions", force: :cascade do |t|
    t.string   "income",               limit: 255
    t.string   "address_years",        limit: 255
    t.string   "company_years",        limit: 255
    t.string   "marital_status",       limit: 255
    t.string   "requested_amount",     limit: 255
    t.string   "payment_terms",        limit: 255
    t.string   "bank",                 limit: 255
    t.string   "comment",              limit: 255
    t.string   "company_name",         limit: 255
    t.string   "company_phone_number", limit: 255
    t.string   "dependents_number",    limit: 255
    t.string   "company_position",     limit: 255
    t.string   "has_sgmm",             limit: 255
    t.string   "has_imss",             limit: 255
    t.string   "has_car",              limit: 255
    t.integer  "profile_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "requisitions", ["profile_id"], name: "index_requisitions_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "password",         limit: 255
    t.string   "facebook_account", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "password_digest",  limit: 255
  end

  add_foreign_key "personal_references", "requisitions"
  add_foreign_key "profiles", "users"
  add_foreign_key "requisitions", "profiles"
end
