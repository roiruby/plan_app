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

ActiveRecord::Schema.define(version: 2019_10_15_162852) do

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "plan_title"
    t.string "content"
    t.bigint "user_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "schedule_title"
    t.string "start_time"
    t.string "end_time"
    t.text "content"
    t.string "spot_name"
    t.string "address"
    t.string "access"
    t.string "business_hour"
    t.bigint "plan_id"
    t.string "regular_holiday"
    t.string "tel"
    t.string "parking"
    t.string "budget"
    t.string "link_url"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_schedules_on_plan_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "image"
    t.string "catchphrase"
    t.string "introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plans", "users"
  add_foreign_key "schedules", "plans"
end
