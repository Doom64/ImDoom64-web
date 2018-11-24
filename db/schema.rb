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

ActiveRecord::Schema.define(version: 2018_11_24_215520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artifacts", force: :cascade do |t|
    t.bigint "commit_id"
    t.integer "build_type", null: false
    t.integer "status", null: false
    t.string "permalink"
    t.index ["commit_id"], name: "index_artifacts_on_commit_id"
  end

  create_table "commits", force: :cascade do |t|
    t.string "uid", null: false
    t.string "author", default: "", null: false
    t.string "author_email", default: "", null: false
    t.string "summary", default: "", null: false
    t.string "description", default: "", null: false
    t.index ["uid"], name: "index_commits_on_uid"
  end

end
