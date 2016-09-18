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

ActiveRecord::Schema.define(version: 20160918092500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "quantity"
    t.integer  "varient_id"
    t.decimal  "price"
    t.string   "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cart_items_on_user_id", using: :btree
    t.index ["varient_id"], name: "index_cart_items_on_varient_id", using: :btree
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "varient_id"
    t.integer  "order_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "product_name"
    t.string   "varient_name"
    t.string   "unit_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
    t.index ["varient_id"], name: "index_line_items_on_varient_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.decimal  "total"
    t.decimal  "fee"
    t.decimal  "payment_total"
    t.string   "state"
    t.string   "payment_type"
    t.datetime "paid_at"
    t.datetime "deadline"
    t.string   "bill_name"
    t.string   "bill_address"
    t.string   "bill_phone"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.string   "shipping_phone"
    t.string   "company_name"
    t.string   "company_registration_number"
    t.string   "order_no"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["shop_id"], name: "index_orders_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "public"
    t.integer  "shop_id"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["shop_id"], name: "index_products_on_shop_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "fb_link"
    t.string   "bank_name"
    t.string   "bank_account"
    t.string   "bank_branch_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "gender"
    t.string   "bill_address"
    t.string   "bill_phone"
    t.string   "contact_address"
    t.string   "contact_phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "varients", force: :cascade do |t|
    t.string   "name"
    t.integer  "stock"
    t.string   "unit_name"
    t.decimal  "price"
    t.integer  "product_id"
    t.datetime "deleted_at"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_varients_on_product_id", using: :btree
  end

end
