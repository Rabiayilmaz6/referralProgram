# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_06_071615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "referral_codes", force: :cascade do |t|
    t.string "code"
    t.bigint "user_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_referral_codes_on_user_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.bigint "referral_code_id", null: false
    t.bigint "referred_user_id", null: false
    t.bigint "referrer_user_id", null: false
    t.integer "status"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referral_code_id"], name: "index_referrals_on_referral_code_id"
    t.index ["referred_user_id"], name: "index_referrals_on_referred_user_id"
    t.index ["referrer_user_id"], name: "index_referrals_on_referrer_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "referral_id", null: false
    t.decimal "amount"
    t.integer "reward_type"
    t.datetime "processed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referral_id"], name: "index_rewards_on_referral_id"
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "referral_codes", "users"
  add_foreign_key "referrals", "referral_codes"
  add_foreign_key "referrals", "users", column: "referred_user_id"
  add_foreign_key "referrals", "users", column: "referrer_user_id"
  add_foreign_key "rewards", "referrals"
  add_foreign_key "rewards", "users"
end
