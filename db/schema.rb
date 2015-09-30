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

ActiveRecord::Schema.define(version: 20150930003249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "text",        null: false
    t.integer  "author_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "text",             null: false
    t.integer  "user_id",          null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "edits", force: true do |t|
    t.integer  "editable_id"
    t.string   "editable_type"
    t.integer  "author_id"
    t.text     "changes",       null: false
    t.text     "explanation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "edits", ["editable_id", "editable_type"], name: "index_edits_on_editable_id_and_editable_type", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "author_id"
    t.string   "title",                  null: false
    t.string   "body",                   null: false
    t.integer  "view_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sided_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "side_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sided_users", ["side_id"], name: "index_sided_users_on_side_id", using: :btree
  add_index "sided_users", ["user_id"], name: "index_sided_users_on_user_id", using: :btree

  create_table "sides", force: true do |t|
    t.integer  "question_id"
    t.integer  "creator_id"
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sides", ["question_id"], name: "index_sides_on_question_id", using: :btree

  create_table "sidings", force: true do |t|
    t.integer  "answer_id",  null: false
    t.integer  "side_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sidings", ["answer_id"], name: "index_sidings_on_answer_id", using: :btree
  add_index "sidings", ["side_id"], name: "index_sidings_on_side_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "taggings", ["question_id"], name: "index_taggings_on_question_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "display_name",                null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "location"
    t.date     "birthday"
    t.text     "bio"
    t.string   "website_link"
    t.integer  "tokens",          default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["display_name"], name: "index_users_on_display_name", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
    t.integer  "value",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree

end
