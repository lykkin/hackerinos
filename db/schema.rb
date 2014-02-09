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

ActiveRecord::Schema.define(version: 20140209213720) do

  create_table "comments", force: true do |t|
    t.integer  "hackerino_id"
    t.string   "content"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["hackerino_id", "created_at"], name: "index_comments_on_hackerino_id_and_created_at", using: :btree

  create_table "hackerinos", force: true do |t|
    t.string   "author"
    t.integer  "vote"
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
