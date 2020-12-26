# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_24_225558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.string "long_name"
    t.string "short_name"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_bodies_on_ancestry"
  end

  create_table "experts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.bigint "title_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
    t.bigint "body_id"
    t.index ["body_id"], name: "index_experts_on_body_id"
    t.index ["title_id"], name: "index_experts_on_title_id"
  end

  create_table "membership_types", force: :cascade do |t|
    t.string "long_name"
    t.string "short_name"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "expert_id", null: false
    t.bigint "body_id", null: false
    t.bigint "membership_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body_id"], name: "index_memberships_on_body_id"
    t.index ["expert_id"], name: "index_memberships_on_expert_id"
    t.index ["membership_type_id"], name: "index_memberships_on_membership_type_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "long_title"
    t.string "short_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experts", "bodies"
  add_foreign_key "experts", "titles"
  add_foreign_key "memberships", "bodies"
  add_foreign_key "memberships", "experts"
  add_foreign_key "memberships", "membership_types"
end
