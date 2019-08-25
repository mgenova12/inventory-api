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

ActiveRecord::Schema.define(version: 20190825160452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "count_bies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quantity"
    t.integer  "quantity_needed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
    t.integer  "store_id"
    t.integer  "store_good_id"
    t.integer  "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "row_order"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "delivery_day"
    t.integer  "store_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "case_quantity"
    t.integer  "distributor_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "category_id"
    t.boolean  "prepped"
    t.integer  "mark_up"
    t.bigint   "barcode"
    t.text     "description"
    t.integer  "distributor_number"
    t.string   "brand"
    t.string   "unit_size"
    t.integer  "portion_size"
    t.decimal  "marked_up_price",    precision: 8, scale: 2
  end

  create_table "store_goods", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "product_id"
    t.integer  "location_id"
    t.integer  "distributor_id"
    t.integer  "max_amount"
    t.boolean  "replenish_by_each"
    t.string   "delivery_day"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "count_by_id"
  end

  create_table "store_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "store_type_id"
  end

end
