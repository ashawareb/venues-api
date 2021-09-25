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

ActiveRecord::Schema.define(version: 20210925211328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_at",                null: false
    t.datetime "end_at",                  null: false
    t.integer  "guest_count", default: 1, null: false
    t.integer  "table_id",                null: false
    t.integer  "integer",                 null: false
    t.integer  "shift_id",                null: false
    t.integer  "venues_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["table_id", "shift_id"], name: "index_reservations_on_table_id_and_shift_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
    t.index ["venues_id"], name: "index_reservations_on_venues_id", using: :btree
  end

  create_table "shifts", force: :cascade do |t|
    t.string   "name",       null: false
    t.time     "start_time", null: false
    t.time     "end_time",   null: false
    t.integer  "venues_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["start_time", "end_time"], name: "index_shifts_on_start_time_and_end_time", using: :btree
    t.index ["venues_id"], name: "index_shifts_on_venues_id", using: :btree
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "min_guest",  default: 1, null: false
    t.integer  "max_guest",  default: 2, null: false
    t.integer  "venues_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["venues_id"], name: "index_tables_on_venues_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "last_login"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "email",                     null: false
    t.string   "phone_number",              null: false
    t.string   "token",        default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["email"], name: "index_venues_on_email", unique: true, using: :btree
  end

end
