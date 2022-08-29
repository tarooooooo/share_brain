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

ActiveRecord::Schema.define(version: 2022_03_27_133740) do

  create_table "admin_users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "article_content_data", charset: "utf8", force: :cascade do |t|
    t.bigint "article_id", null: false, comment: "記事ID"
    t.text "summary", null: false, comment: "商品概要"
    t.integer "price", null: false, comment: "価格"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_content_data_on_article_id", unique: true
  end

  create_table "article_knowledge_tags", charset: "utf8", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "knowledge_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_knowledge_tags_on_article_id"
    t.index ["knowledge_tag_id"], name: "index_article_knowledge_tags_on_knowledge_tag_id"
  end

  create_table "articles", charset: "utf8", force: :cascade do |t|
    t.bigint "writer_id", null: false, comment: "ユーザーID"
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "published_at"
    t.integer "publish_status", default: 0, null: false
    t.integer "status", default: 0, null: false, comment: "種別： {\"無料\"=>0, \"有料\"=>1}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["writer_id"], name: "index_articles_on_writer_id"
  end

  create_table "knowledge_tags", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_knowledge_tags_on_name", unique: true
  end

  create_table "paid_article_contents", charset: "utf8", force: :cascade do |t|
    t.bigint "paid_article_id", null: false
    t.string "main_image", null: false
    t.string "movie_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paid_article_id"], name: "index_paid_article_contents_on_paid_article_id", unique: true
  end

  create_table "paid_article_notifications", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.bigint "writer_id", null: false
    t.bigint "paid_article_id", null: false
    t.datetime "published_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paid_article_id"], name: "index_paid_article_notifications_on_paid_article_id"
    t.index ["writer_id"], name: "index_paid_article_notifications_on_writer_id"
  end

  create_table "paid_article_orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.bigint "article_id", comment: "記事ID"
    t.bigint "paid_article_id"
    t.integer "payment_method", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_paid_article_orders_on_article_id"
    t.index ["buyer_id"], name: "index_paid_article_orders_on_buyer_id"
    t.index ["paid_article_id"], name: "index_paid_article_orders_on_paid_article_id"
  end

  create_table "paid_article_sales", charset: "utf8", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "paid_article_order_id", null: false
    t.float "fee_rate", null: false
    t.integer "fee", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paid_article_order_id"], name: "index_paid_article_sales_on_paid_article_order_id"
    t.index ["seller_id"], name: "index_paid_article_sales_on_seller_id"
  end

  create_table "paid_articles", charset: "utf8", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.integer "price", default: 0, null: false
    t.datetime "published_at"
    t.integer "publish_status", default: 0, null: false
    t.string "attachment_file", default: "0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_paid_articles_on_seller_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", default: "", null: false
    t.string "icon_image", comment: "アイコン画像"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_content_data", "articles"
  add_foreign_key "article_knowledge_tags", "articles"
  add_foreign_key "article_knowledge_tags", "knowledge_tags"
  add_foreign_key "articles", "users", column: "writer_id"
  add_foreign_key "paid_article_contents", "paid_articles"
  add_foreign_key "paid_article_orders", "articles"
  add_foreign_key "paid_article_orders", "paid_articles"
  add_foreign_key "paid_article_orders", "users", column: "buyer_id"
  add_foreign_key "paid_article_sales", "paid_article_orders"
  add_foreign_key "paid_article_sales", "users", column: "seller_id"
  add_foreign_key "paid_articles", "users", column: "seller_id"
end
