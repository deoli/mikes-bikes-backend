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

ActiveRecord::Schema[8.0].define(version: 2025_01_20_102857) do
  create_table "blueprints", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.boolean "is_optional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_blueprints_on_parent_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "stock_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "part_id", null: false
    t.index ["part_id"], name: "index_parts_products_on_part_id"
    t.index ["product_id"], name: "index_parts_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "blueprint_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_products_on_blueprint_id"
    t.index ["parent_id"], name: "index_products_on_parent_id"
  end

  add_foreign_key "blueprints", "blueprints", column: "parent_id"
  add_foreign_key "products", "blueprints"
  add_foreign_key "products", "products", column: "parent_id"
end
