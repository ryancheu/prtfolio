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

ActiveRecord::Schema.define(version: 20131208205938) do

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
    t.text     "content"
    t.string   "language"
  end

  create_table "descriptions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

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
    t.integer  "image_id"
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
    t.string   "slug"
    t.text     "bio"
    t.string   "realname"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

  create_table "videos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video"
    t.string   "video_html"
  end

end
