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

ActiveRecord::Schema.define(version: 20131125012319) do

  create_table "blocks", force: true do |t|
    t.integer  "page_index"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "firstres_id"
    t.integer  "secondres_id"
    t.string   "firstres_type"
    t.string   "secondres_type"
    t.integer  "template_id"
  end

  create_table "codes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gist_id"
    t.string   "link"
  end

  create_table "descriptions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
  end

  create_table "portfolios", force: true do |t|
    t.integer  "user_id"
    t.string   "font"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "title"
    t.integer  "image_id"
  end

  create_table "themes", force: true do |t|
    t.integer  "portfolio_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fullname"
    t.string   "username"
    t.string   "email"
    t.string   "remember_token"
    t.string   "uid"
    t.string   "auth_token"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
