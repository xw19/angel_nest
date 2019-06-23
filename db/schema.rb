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

ActiveRecord::Schema.define(version: 20110717223142) do

  create_table "investor_profiles", force: :cascade do |t|
    t.string   "tagline",        limit: 255
    t.string   "funds_to_offer", limit: 255
    t.text     "description",    limit: 65535
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investor_profiles", ["user_id"], name: "index_investor_profiles_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.boolean  "is_read",                   default: false
    t.boolean  "is_private",                default: false
    t.boolean  "is_archived",               default: false
    t.integer  "target_id",   limit: 4
    t.string   "target_type", limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "proposal_id", limit: 4
    t.integer  "topic_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["is_private", "target_type", "target_id"], name: "comments_by_type", using: :btree
  add_index "messages", ["is_read", "is_private", "target_type", "target_id"], name: "comments_by_type_by_read", using: :btree
  add_index "messages", ["topic_id"], name: "index_messages_on_topic_id", using: :btree
  add_index "messages", ["user_id", "is_private", "is_archived", "proposal_id"], name: "comments_by_archived_by_proposal", using: :btree
  add_index "messages", ["user_id", "is_private", "target_type", "target_id"], name: "comments_by_type_by_user", using: :btree
  add_index "messages", ["user_id", "proposal_id"], name: "index_messages_on_user_id_and_proposal_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "proposal_for_investors", id: false, force: :cascade do |t|
    t.integer  "proposal_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposal_for_investors", ["proposal_id", "user_id"], name: "index_proposal_for_investors_on_proposal_id_and_user_id", using: :btree
  add_index "proposal_for_investors", ["proposal_id"], name: "index_proposal_for_investors_on_proposal_id", using: :btree
  add_index "proposal_for_investors", ["user_id"], name: "index_proposal_for_investors_on_user_id", using: :btree

  create_table "proposals", force: :cascade do |t|
    t.string   "proposal_stage_identifier",            limit: 255
    t.boolean  "new_business_model",                                 default: false
    t.boolean  "new_product",                                        default: false
    t.string   "pitch",                                limit: 255
    t.text     "introduction",                         limit: 65535
    t.text     "one_year_target_audience",             limit: 65535
    t.integer  "one_year_per_capita_annual_spending",  limit: 4,     default: 0
    t.integer  "one_year_number_of_users",             limit: 4,     default: 0
    t.integer  "one_year_market_cap",                  limit: 4,     default: 0
    t.integer  "one_year_penetration_rate",            limit: 4,     default: 0
    t.text     "one_year_marketing_strategy",          limit: 65535
    t.integer  "one_year_gross_profit_margin",         limit: 4,     default: 0
    t.text     "five_year_target_audience",            limit: 65535
    t.integer  "five_year_per_capita_annual_spending", limit: 4,     default: 0
    t.integer  "five_year_number_of_users",            limit: 4,     default: 0
    t.integer  "five_year_market_cap",                 limit: 4,     default: 0
    t.integer  "five_year_penetration_rate",           limit: 4,     default: 0
    t.text     "five_year_marketing_strategy",         limit: 65535
    t.integer  "five_year_gross_profit_margin",        limit: 4,     default: 0
    t.text     "competitors_details",                  limit: 65535
    t.text     "competitive_edges",                    limit: 65535
    t.text     "competing_strategy",                   limit: 65535
    t.integer  "investment_amount",                    limit: 4,     default: 0
    t.string   "investment_currency",                  limit: 255
    t.integer  "equity_percentage",                    limit: 4,     default: 0
    t.text     "spending_plan",                        limit: 65535
    t.integer  "next_investment_round",                limit: 4,     default: 0
    t.integer  "startup_id",                           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposals", ["proposal_stage_identifier"], name: "index_proposals_on_proposal_stage_identifier", using: :btree
  add_index "proposals", ["startup_id"], name: "index_proposals_on_startup_id", using: :btree

  create_table "startup_photos", force: :cascade do |t|
    t.string   "photo",      limit: 255
    t.integer  "startup_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "startup_photos", ["startup_id"], name: "index_startup_photos_on_startup_id", using: :btree

  create_table "startup_users", force: :cascade do |t|
    t.integer  "startup_id",      limit: 4
    t.string   "user_email",      limit: 255
    t.string   "role_identifier", limit: 255
    t.string   "member_title",    limit: 255, default: ""
    t.boolean  "confirmed",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "startup_users", ["confirmed"], name: "index_startup_users_on_confirmed", using: :btree
  add_index "startup_users", ["startup_id", "confirmed"], name: "index_startup_users_on_startup_id_and_confirmed", using: :btree
  add_index "startup_users", ["startup_id", "user_email"], name: "index_startup_users_on_startup_id_and_user_email", using: :btree
  add_index "startup_users", ["startup_id"], name: "index_startup_users_on_startup_id", using: :btree
  add_index "startup_users", ["user_email"], name: "index_startup_users_on_user_email", using: :btree

  create_table "startups", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "pitch",             limit: 255
    t.string   "funds_to_raise",    limit: 255
    t.string   "stage_identifier",  limit: 255
    t.string   "market_identifier", limit: 255
    t.string   "location",          limit: 255
    t.text     "description",       limit: 65535
    t.string   "logo",              limit: 255
    t.integer  "followers_count",   limit: 4,     default: 0
    t.integer  "followed_count",    limit: 4,     default: 0
    t.integer  "comments_count",    limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "startups", ["location"], name: "index_startups_on_location", using: :btree
  add_index "startups", ["market_identifier", "location"], name: "index_startups_on_market_identifier_and_location", using: :btree
  add_index "startups", ["name"], name: "index_startups_on_name", unique: true, using: :btree

  create_table "target_followers", force: :cascade do |t|
    t.integer  "follower_id",   limit: 4
    t.string   "follower_type", limit: 255
    t.integer  "target_id",     limit: 4
    t.string   "target_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_followers", ["follower_id", "target_type", "target_id"], name: "target_followers_follwer", unique: true, using: :btree
  add_index "target_followers", ["follower_id"], name: "index_target_followers_on_follower_id", using: :btree
  add_index "target_followers", ["follower_type", "follower_id", "target_type", "target_id"], name: "target_followers_follwer_with_type", unique: true, using: :btree
  add_index "target_followers", ["follower_type", "follower_id"], name: "index_target_followers_on_follower_type_and_follower_id", using: :btree
  add_index "target_followers", ["target_id"], name: "index_target_followers_on_target_id", using: :btree
  add_index "target_followers", ["target_type", "target_id"], name: "index_target_followers_on_target_type_and_target_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "name",                   limit: 255
    t.string   "location",               limit: 255
    t.string   "introduction",           limit: 255
    t.integer  "followers_count",        limit: 4,   default: 0
    t.integer  "followed_count",         limit: 4,   default: 0
    t.integer  "messages_count",         limit: 4,   default: 0
    t.integer  "comments_count",         limit: 4,   default: 0
    t.boolean  "is_admin",                           default: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "authentication_token",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["is_admin"], name: "index_users_on_is_admin", using: :btree
  add_index "users", ["location"], name: "index_users_on_location", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
