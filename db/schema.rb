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

ActiveRecord::Schema.define(:version => 20120226123433) do

  create_table "donation_year_links", :force => true do |t|
    t.integer  "donation_id"
    t.integer  "yearly_detail_id"
    t.string   "linked_by"
    t.decimal  "linked_amount",    :precision => 12, :scale => 2
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer  "donor_id"
    t.decimal  "amount"
    t.string   "status"
    t.string   "donation_type"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "purpose"
  end

  create_table "donors", :force => true do |t|
    t.string   "email"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "address_first_line"
    t.string   "address_second_line"
    t.string   "address_landmark"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "pincode"
    t.string   "phone"
    t.string   "mobile"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "anonymous"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "donor_type"
    t.string   "district"
    t.string   "title"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "student_donation_links", :force => true do |t|
    t.integer  "student_id"
    t.integer  "donation_id"
    t.string   "linked_by"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "district"
    t.string   "taluka"
    t.string   "vp_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_name"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "pmt_address_line1"
    t.string   "pmt_address_line2"
    t.string   "pmt_landmark"
    t.string   "pmt_city"
    t.string   "pmt_state"
    t.string   "pmt_country"
    t.string   "pmt_pincode"
    t.text     "pmt_full_address"
    t.string   "cur_address_line1"
    t.string   "cur_address_line2"
    t.string   "cur_landmark"
    t.string   "cur_city"
    t.string   "cur_state"
    t.string   "cur_country"
    t.string   "cur_pincode"
    t.text     "cur_full_address"
    t.string   "primary_phone"
    t.string   "additional_phone"
    t.string   "father_occupation"
    t.string   "mother_occupation"
    t.decimal  "total_family_income"
    t.string   "gender"
    t.string   "area_type"
    t.string   "caste"
    t.string   "category"
    t.string   "studied_medium"
    t.decimal  "sslc_percentage"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "yearly_details", :force => true do |t|
    t.integer  "student_id"
    t.integer  "year",                  :limit => 255
    t.string   "coll_name"
    t.string   "coll_address_line1"
    t.string   "coll_address_line2"
    t.string   "coll_landmark"
    t.string   "coll_city"
    t.string   "coll_state"
    t.string   "coll_country"
    t.string   "coll_pincode"
    t.text     "coll_full_address"
    t.string   "coll_primary_phone"
    t.string   "coll_additional_phone"
    t.decimal  "result_odd"
    t.decimal  "result_even"
    t.decimal  "result_aggregate"
    t.integer  "result_year",           :limit => 255
    t.string   "course"
    t.string   "stream"
    t.decimal  "amount_fees"
    t.decimal  "amount_donation"
    t.decimal  "amount_bus_pass"
    t.decimal  "amount_add_on"
    t.decimal  "amount_total"
    t.string   "chalan_number"
    t.string   "vr_number"
    t.boolean  "books_given"
    t.string   "books_given_center"
    t.boolean  "camp_invited"
    t.boolean  "camp_attended"
    t.date     "camp_date"
    t.string   "camp_place"
    t.string   "fac_name"
    t.string   "fac_address_line1"
    t.string   "fac_address_line2"
    t.string   "fac_landmark"
    t.string   "fac_city"
    t.string   "fac_state"
    t.string   "fac_country"
    t.string   "fac_pincode"
    t.text     "fac_full_address"
    t.string   "fac_primary_phone"
    t.string   "fac_additional_phone"
    t.boolean  "letter1_sent"
    t.boolean  "letter2_sent"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

