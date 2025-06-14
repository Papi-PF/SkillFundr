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

ActiveRecord::Schema[7.2].define(version: 2025_06_06_025036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "learning_paths", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.boolean "ai_generated"
    t.index ["skill_id"], name: "index_learning_paths_on_skill_id"
    t.index ["user_id"], name: "index_learning_paths_on_user_id"
  end

  create_table "learning_paths_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "completed"
    t.integer "position"
    t.bigint "learning_path_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estimated_days"
    t.text "metadata"
    t.index ["learning_path_id"], name: "index_milestones_on_learning_path_id"
  end

  create_table "milestones_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "difficulty", default: "Beginner"
    t.boolean "featured", default: false
    t.index ["featured"], name: "index_skills_on_featured"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "learning_style"
    t.boolean "funding_eligibility", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "learning_paths", "skills"
  add_foreign_key "learning_paths", "users"
  add_foreign_key "milestones", "learning_paths"
end
