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

ActiveRecord::Schema.define(version: 20180205212238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "permalink", null: false
    t.text "description", null: false
    t.integer "employees_count", default: 0
    t.date "born_date"
    t.string "phone_number"
    t.string "email"
    t.string "website_url"
    t.string "linkedin_url"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name"
    t.index ["permalink"], name: "index_companies_on_permalink"
    t.index ["status"], name: "index_companies_on_status"
  end

  create_table "deal_investors", force: :cascade do |t|
    t.bigint "deal_id", null: false
    t.bigint "investor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_deal_investors_on_deal_id"
    t.index ["investor_id"], name: "index_deal_investors_on_investor_id"
  end

  create_table "deals", force: :cascade do |t|
    t.date "close_date", null: false
    t.bigint "company_id", null: false
    t.string "status", default: "unverified", null: false
    t.string "category", null: false
    t.string "round"
    t.string "amount_currency"
    t.integer "amount_cents"
    t.string "pre_valuation_currency"
    t.integer "pre_valuation_cents"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_deals_on_category"
    t.index ["company_id"], name: "index_deals_on_company_id"
    t.index ["round"], name: "index_deals_on_round"
    t.index ["status"], name: "index_deals_on_status"
  end

  create_table "investor_markets", force: :cascade do |t|
    t.bigint "investor_id", null: false
    t.bigint "market_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_investor_markets_on_investor_id"
    t.index ["market_id"], name: "index_investor_markets_on_market_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "investable_type", null: false
    t.bigint "investable_id", null: false
    t.string "status", default: "active", null: false
    t.string "category"
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investable_type", "investable_id"], name: "index_investors_on_investable_type_and_investable_id"
    t.index ["status"], name: "index_investors_on_status"
  end

  create_table "localizables", force: :cascade do |t|
    t.string "localizable_type", null: false
    t.bigint "localizable_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["localizable_type", "localizable_id"], name: "index_localizables_on_localizable_type_and_localizable_id"
    t.index ["location_id"], name: "index_localizables_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country", null: false
    t.string "region", null: false
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_locations_on_city"
    t.index ["country"], name: "index_locations_on_country"
    t.index ["region"], name: "index_locations_on_region"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_markets_on_name"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "permalink", null: false
    t.text "description", null: false
    t.date "born_date"
    t.string "gender"
    t.string "phone_number"
    t.string "occupation"
    t.string "email"
    t.string "website_url"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "google_plus_url"
    t.string "linkedin_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_people_on_name"
    t.index ["permalink"], name: "index_people_on_permalink"
  end

  create_table "person_companies", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "company_id", null: false
    t.string "job_title", null: false
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_person_companies_on_company_id"
    t.index ["job_title"], name: "index_person_companies_on_job_title"
    t.index ["person_id"], name: "index_person_companies_on_person_id"
  end

end
