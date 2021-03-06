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

ActiveRecord::Schema.define(version: 20141002023255) do

  create_table "designer_registrants", force: true do |t|
    t.integer  "user_id"
    t.string   "specialty"
    t.string   "prefecture"
    t.text     "demand"
    t.string   "productimage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designer_registrants", ["user_id", "created_at"], name: "index_designer_registrants_on_user_id_and_created_at"

  create_table "find_designer_posts", force: true do |t|
    t.string   "title"
    t.string   "area"
    t.string   "prefecture"
    t.string   "purpose"
    t.text     "demand"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fdpimage"
    t.string   "fdpimage2"
    t.string   "budget"
  end

  add_index "find_designer_posts", ["user_id", "created_at"], name: "index_find_designer_posts_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
