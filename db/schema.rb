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

ActiveRecord::Schema.define(version: 20140320204804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "recipe_needs", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.float    "amount"
    t.string   "amount_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.string   "prep_time"
    t.string   "cook_time"
  end

  add_index "recipes", ["name"], name: "index_recipes_on_name", unique: true, using: :btree

  create_table "steps", force: true do |t|
    t.text     "description", null: false
    t.integer  "ord",         null: false
    t.integer  "recipe_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["recipe_id", "ord"], name: "index_steps_on_recipe_id_and_ord", unique: true, using: :btree
  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

end
