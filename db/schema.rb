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

ActiveRecord::Schema[7.0].define(version: 2022_03_31_135812) do
  create_table "pledgegroups", force: :cascade do |t|
    t.text "admins"
    t.boolean "is_public", default: false
    t.text "pledges"
    t.integer "budget", default: 0
    t.decimal "amount_paid", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: ""
    t.string "profile_img", default: ""
    t.boolean "admin", default: false
    t.string "user_id", default: ""
  end

end
