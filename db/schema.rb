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

ActiveRecord::Schema.define(version: 20210616183548) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.string   "post_cord",   null: false
    t.string   "address",     null: false
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "admins", force: :cascade do |t|
    t.text     "email",              null: false
    t.text     "encrypted_password", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "item_id",     null: false
    t.integer  "customer_id", null: false
    t.integer  "amount",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "last_name",                          null: false
    t.string   "first_name",                         null: false
    t.string   "last_name_kana",                     null: false
    t.string   "first_name_kana",                    null: false
    t.string   "post_cord",                          null: false
    t.string   "address",                            null: false
    t.string   "telephone",                          null: false
    t.string   "encrypted_password",                 null: false
    t.boolean  "customer_status",    default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "genre_id",                    null: false
    t.string   "name",                        null: false
    t.text     "introduction",                null: false
    t.integer  "price",                       null: false
    t.string   "image_id",                    null: false
    t.boolean  "is_active",    default: true, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id",                       null: false
    t.integer  "order_id",                      null: false
    t.integer  "item_quantity",                 null: false
    t.integer  "production_status", default: 0, null: false
    t.integer  "price",                         null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",                null: false
    t.integer  "postage",                    null: false
    t.integer  "total_payment",              null: false
    t.integer  "payment_method", default: 0, null: false
    t.string   "name",                       null: false
    t.string   "address",                    null: false
    t.string   "post_cord",                  null: false
    t.integer  "order_status",   default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
