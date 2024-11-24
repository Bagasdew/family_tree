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

ActiveRecord::Schema[7.1].define(version: 2024_11_24_022814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "family_lines", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "ancestor_id"
    t.integer "relationship_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestor_id", "person_id", "relationship_type"], name: "idx_on_ancestor_id_person_id_relationship_type_f03378a475"
    t.index ["ancestor_id"], name: "index_family_lines_on_ancestor_id"
    t.index ["person_id", "ancestor_id", "relationship_type"], name: "idx_on_person_id_ancestor_id_relationship_type_b6faeae36c"
    t.index ["person_id"], name: "index_family_lines_on_person_id"
  end

  create_table "persons", force: :cascade do |t|
    t.string "name"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_persons_on_name", unique: true
  end

  add_foreign_key "family_lines", "persons"
  add_foreign_key "family_lines", "persons", column: "ancestor_id"
end
