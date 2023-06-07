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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_032232) do
  create_table "cars", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "enterprise_id"
    t.string "car_number"
    t.string "weight"
    t.string "driver_name"
    t.string "driver_tel"
    t.string "driver_id_card_number"
    t.string "driver_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "material_reserf_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_goods_statistics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "enterprise_id"
    t.string "region"
    t.string "sales_inventory_situation"
    t.integer "rice"
    t.integer "flour"
    t.integer "oil"
    t.integer "vegetables"
    t.integer "pork"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "daily_goods_date"
    t.string "beef", comment: "牛肉"
    t.string "lamb", comment: "羊肉"
    t.string "poultry", comment: "禽肉"
    t.string "egg", comment: "鸡蛋"
    t.string "milk", comment: "牛奶"
    t.string "fruit", comment: "水果"
    t.string "convenient_food", comment: "方便食品"
    t.integer "manager_id"
    t.string "rice_sales"
    t.string "flour_sales"
    t.string "oil_sales"
    t.string "pork_sales"
    t.string "vegetables_sales"
    t.string "beef_sales", comment: "牛肉"
    t.string "lamb_sales", comment: "羊肉"
    t.string "poultry_sales", comment: "禽肉"
    t.string "egg_sales", comment: "鸡蛋"
    t.string "milk_sales", comment: "牛奶"
    t.string "fruit_sales", comment: "水果"
    t.string "convenient_food_sales", comment: "方便食品"
    t.string "rice_purchase"
    t.string "flour_purchase"
    t.string "oil_purchase"
    t.string "pork_purchase"
    t.string "vegetables_purchase"
    t.string "beef_purchase", comment: "牛肉"
    t.string "lamb_purchase", comment: "羊肉"
    t.string "poultry_purchase", comment: "禽肉"
    t.string "egg_purchase", comment: "鸡蛋"
    t.string "milk_purchase", comment: "牛奶"
    t.string "fruit_purchase", comment: "水果"
    t.string "convenient_food_purchase", comment: "方便食品"
    t.string "informant"
    t.string "informant_tel"
    t.boolean "status"
    t.index ["region", "daily_goods_date", "sales_inventory_situation", "manager_id"], name: "daily_goods_statistics_unique_index", unique: true
  end

  create_table "enterprise_approvals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "approval_name"
    t.string "tel"
    t.string "status"
    t.string "enterprise_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "business_license"
    t.binary "business_processing_license"
    t.binary "food_distribution_license"
    t.binary "warehouse_photos_one"
    t.binary "warehouse_photos_two"
    t.binary "warehouse_photos_three"
  end

  create_table "enterprise_personnels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "enterprise_id"
    t.string "person_in_charge"
    t.string "person_in_charge_tel"
    t.string "enterprise_address"
    t.string "material_type"
    t.string "warehouse_address"
    t.string "warehoues_type"
    t.string "inventory_quantity"
    t.string "warehouse_manager"
    t.string "warehouse_manager_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.string "family_address"
    t.string "id_card"
    t.string "email"
    t.string "name"
    t.string "tel", comment: "录入员手机号码"
    t.string "category"
  end

  create_table "enterprises", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "enterprise_category"
    t.string "goods_category"
    t.string "person_in_charge"
    t.string "person_in_charge_tel"
    t.string "person_in_charge_of_data_entry"
    t.string "person_in_charge_of_data_entry_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.binary "business_license"
    t.binary "business_processing_license"
    t.binary "food_distribution_license"
    t.binary "warehouse_photos_one"
    t.binary "warehouse_photos_two"
    t.binary "warehouse_photos_three"
    t.string "status"
    t.integer "manager_id"
    t.binary "legal_person_image"
    t.string "storage_capacity"
    t.boolean "sorting_and_distribution", default: false
  end

  create_table "goods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "enterprise_id"
    t.integer "material_reserf_id"
    t.string "administrative_division"
    t.string "goods_type"
    t.string "quantity"
    t.string "person_in_charge"
    t.string "person_in_charge_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods_data_submissions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "enterprise_id"
    t.datetime "last_reported_time", precision: nil
    t.string "reported_data"
    t.string "report_person"
    t.string "report_person_tel"
    t.boolean "report_status_today"
    t.string "operations"
    t.string "enterprise_category"
    t.string "goods_category"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "manager_id"
  end

  create_table "goods_warns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "goods_category"
    t.string "goods_name"
    t.string "Adequate_warning_value"
    t.string "Insufficient_warning_value"
    t.string "Below_warning_value"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", comment: "包括：管理员，保供企业，以及地州商务局"
    t.integer "region_id"
    t.string "name"
    t.string "owner"
    t.boolean "status"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count", default: 0
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "material_reserves", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "region"
    t.integer "enterprise_id"
    t.string "enterprise_category"
    t.string "goods_type"
    t.string "storage_apacity"
    t.string "person_in_charge"
    t.string "tel"
    t.string "warehouse_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "max_store"
    t.string "longitude", comment: "仓库经度"
    t.string "latitude", comment: "仓库纬度"
    t.binary "image_one"
    t.binary "image_two"
    t.binary "image_three"
    t.boolean "sorting_and_distribution", default: false
    t.string "warehouse_location_two"
    t.string "latitude_two"
    t.string "longitude_two"
    t.binary "image_four"
    t.binary "image_five"
    t.binary "image_six"
    t.binary "image_seven"
    t.binary "image_eight"
    t.binary "image_nine"
    t.binary "image_ten"
    t.string "sorting_and_distribution_type"
  end

  create_table "regions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warn_settings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "goods_name"
    t.string "goods_category"
    t.string "max_warn"
    t.string "min_warn"
    t.string "remak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "simple_data"
    t.string "warn_data"
    t.string "danger_data"
  end

  create_table "warns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "region_id"
    t.integer "material_reserf_id"
    t.integer "enterprise_id"
    t.string "enterprise_category"
    t.string "goods_category"
    t.string "unit"
    t.string "max_warn"
    t.string "min_warn"
    t.string "warn_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "material_reserf_number"
  end

end
