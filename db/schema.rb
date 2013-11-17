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

ActiveRecord::Schema.define(version: 20131117113346) do

  create_table "blocks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_index"
    t.integer  "project_id"
  end

  create_table "porfolios", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "font"
  end

  create_table "portfolios", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
    t.integer  "portfolio_id"
  end

  create_table "resources", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "block_id"
  end

  create_table "templates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "block_id"
  end

  create_table "themes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
    t.integer  "project_id"
  end

  create_table "users", force: true do |t|
    t.string   "fullname"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "portfolio_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
