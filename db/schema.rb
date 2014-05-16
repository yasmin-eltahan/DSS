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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140514215030) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.string   "headquarters"
    t.string   "size"
    t.string   "owner"
    t.string   "goals"
    t.boolean  "public"
    t.integer  "no_of_employees"
    t.integer  "revenue"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "phone"
    t.integer  "no_of_branches"
    t.text     "description"
    t.boolean  "show",            :default => false
    t.boolean  "confirm",         :default => false
    t.string   "image"
  end

  create_table "company_criteria", :force => true do |t|
    t.integer  "company_id"
    t.integer  "criteria_id"
    t.integer  "system_id"
    t.decimal  "value",       :precision => 16, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "weight",                                     :default => 0
  end

  create_table "company_criterions", :force => true do |t|
    t.integer  "company_id"
    t.integer  "criterion_id"
    t.integer  "system_id"
    t.integer  "weight"
    t.integer  "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "company_requirements", :force => true do |t|
    t.integer  "company_id"
    t.integer  "requirement_id"
    t.string   "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "max"
  end

  create_table "company_subcriteria", :force => true do |t|
    t.integer  "subcriteria_id"
    t.integer  "company_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "company_subcriterions", :force => true do |t|
    t.integer  "subcriterion_id"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "company_systems", :force => true do |t|
    t.integer  "company_id"
    t.integer  "system_id"
    t.integer  "final_score"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "company_users", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "criteria", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "criterions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ranks", :force => true do |t|
    t.integer  "rank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "source"
    t.integer  "system_id"
    t.integer  "vendor_id"
  end

  create_table "reasons", :force => true do |t|
    t.integer  "company_id"
    t.integer  "criterion_id"
    t.integer  "user_id"
    t.text     "reason"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "requirements", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "type_id"
  end

  create_table "reviews", :force => true do |t|
    t.string   "review"
    t.string   "review2"
    t.string   "review3"
    t.string   "reviewer"
    t.string   "source"
    t.string   "result"
    t.integer  "system_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spec_versions", :force => true do |t|
    t.integer  "spec_id"
    t.integer  "version_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subcriteria", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "criteria_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subcriterions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "criterion_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "system_requirements", :force => true do |t|
    t.integer  "system_id"
    t.integer  "requirement_id"
    t.string   "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "max"
  end

  create_table "system_technicals", :force => true do |t|
    t.integer  "system_id"
    t.integer  "technical_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "value"
  end

  create_table "systems", :force => true do |t|
    t.integer  "vendor_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.string   "programming_language"
    t.integer  "no_of_employees"
    t.text     "description"
  end

  create_table "systems_technicals", :id => false, :force => true do |t|
    t.integer  "system_id"
    t.integer  "technical_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "technicals", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.boolean  "technical"
    t.string   "description"
    t.boolean  "string"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "role",                   :default => "viewer"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.integer  "revenue"
    t.boolean  "public",          :default => false
    t.integer  "no_of_employees"
    t.string   "headquarters"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "phone"
    t.text     "description"
    t.string   "image"
  end

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "Price"
    t.integer  "system_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
