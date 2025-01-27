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

ActiveRecord::Schema[8.0].define(version: 2025_01_27_005610) do
  create_table "blueprint_products", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "product_id", null: false
    t.integer "blueprint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock_count"
    t.index ["blueprint_id"], name: "index_blueprint_products_on_blueprint_id"
    t.index ["parent_id"], name: "index_blueprint_products_on_parent_id"
    t.index ["product_id"], name: "index_blueprint_products_on_product_id"
  end

  create_table "blueprints", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.boolean "is_optional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_blueprints_on_parent_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blueprint_products", "blueprints"
  add_foreign_key "blueprint_products", "products"
  add_foreign_key "blueprint_products", "products", column: "parent_id"
  add_foreign_key "blueprints", "blueprints", column: "parent_id"
end
