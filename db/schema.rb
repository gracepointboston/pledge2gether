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

ActiveRecord::Schema[7.0].define(version: 2021_01_11_231100) do
  create_table "task_lists", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "note"
    t.string "list_of_tasks"
    t.string "user_id", default: ""
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "deadline"
    t.string "note"
    t.integer "duration"
    t.boolean "scheduled_event"
    t.string "task_list", default: ""
    t.string "completion_date"
    t.string "planned_completion_date"
    t.string "user_id", default: ""
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: ""
    t.string "profile_img", default: ""
    t.boolean "admin", default: false
    t.string "user_id", default: ""
  end

end
