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

ActiveRecord::Schema.define(version: 20170708011624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "bullet_points", force: :cascade do |t|
    t.text     "content"
    t.string   "itemable_type"
    t.integer  "itemable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["itemable_type", "itemable_id"], name: "index_bullet_points_on_itemable_type_and_itemable_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.date     "from"
    t.date     "to"
    t.string   "location"
    t.string   "noteworthy_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.string   "job_title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "company"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "company"
    t.date     "from"
    t.date     "to"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "skill_list"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "programming_languages"
    t.string   "other_skills"
  end

end
