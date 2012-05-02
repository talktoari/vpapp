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

ActiveRecord::Schema.define(:version => 20120502173609) do

  create_table "cities", :force => true do |t|
    t.string   "city_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donation_purposes", :force => true do |t|
    t.string    "donation_purpose"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donation_statuses", :force => true do |t|
    t.string    "donation_status"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donation_types", :force => true do |t|
    t.string    "donation_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donation_year_links", :force => true do |t|
    t.integer   "donation_id"
    t.integer   "yearly_detail_id"
    t.string    "linked_by"
    t.decimal   "linked_amount"
    t.text      "comments"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer   "donor_id"
    t.decimal   "amount"
    t.string    "status"
    t.string    "donation_type"
    t.text      "comment"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "purpose"
    t.date      "donation_date"
  end

  create_table "donor_titles", :force => true do |t|
    t.string    "donor_title"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donor_types", :force => true do |t|
    t.string    "donor_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "donors", :force => true do |t|
    t.string    "email"
    t.string    "gender"
    t.date      "date_of_birth"
    t.string    "address_first_line"
    t.string    "address_second_line"
    t.string    "address_landmark"
    t.string    "city"
    t.string    "state"
    t.string    "country"
    t.string    "pincode"
    t.string    "phone"
    t.string    "mobile"
    t.text      "comment"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "anonymous"
    t.string    "first_name"
    t.string    "last_name"
    t.string    "donor_type"
    t.string    "district"
    t.string    "title"
    t.string    "ser_no"
  end

  create_table "posts", :force => true do |t|
    t.string    "name"
    t.string    "title"
    t.text      "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text      "message"
    t.string    "username"
    t.integer   "item"
    t.string    "table"
    t.integer   "month"
    t.integer   "year"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "states", :force => true do |t|
    t.string   "state_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_area_types", :force => true do |t|
    t.string    "area_type_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_castes", :force => true do |t|
    t.string    "caste_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_categories", :force => true do |t|
    t.string    "category_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_districts", :force => true do |t|
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_donation_links", :force => true do |t|
    t.integer   "student_id"
    t.integer   "donation_id"
    t.string    "linked_by"
    t.string    "comment"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_parent_occupations", :force => true do |t|
    t.string    "occupation_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_study_meds", :force => true do |t|
    t.string    "medium_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "student_talukas", :force => true do |t|
    t.string   "taluka"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string    "district"
    t.string    "taluka"
    t.string    "vp_id"
    t.string    "first_name"
    t.string    "last_name"
    t.string    "father_name"
    t.date      "date_of_birth"
    t.string    "email"
    t.string    "pmt_address_line1"
    t.string    "pmt_address_line2"
    t.string    "pmt_landmark"
    t.string    "pmt_city"
    t.string    "pmt_state"
    t.string    "pmt_country"
    t.string    "pmt_pincode"
    t.text      "pmt_full_address"
    t.string    "cur_address_line1"
    t.string    "cur_address_line2"
    t.string    "cur_landmark"
    t.string    "cur_city"
    t.string    "cur_state"
    t.string    "cur_country"
    t.string    "cur_pincode"
    t.text      "cur_full_address"
    t.string    "primary_phone"
    t.string    "additional_phone"
    t.string    "father_occupation"
    t.string    "mother_occupation"
    t.decimal   "total_family_income"
    t.string    "gender"
    t.string    "area_type"
    t.string    "caste"
    t.string    "category"
    t.string    "studied_medium"
    t.decimal   "sslc_percentage"
    t.text      "comments"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "ser_no"
    t.string    "cet_rank"
    t.string    "exam_ticket_number"
    t.string    "account_number"
    t.string    "atm_number"
    t.string    "house_visited_by"
    t.string    "last_year_donor"
    t.string    "present_year_donor"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "yearly_detail_courses", :force => true do |t|
    t.string   "course"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yearly_detail_streams", :force => true do |t|
    t.string   "stream"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yearly_detail_years", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yearly_details", :force => true do |t|
    t.integer   "student_id"
    t.integer   "year"
    t.string    "coll_name"
    t.string    "coll_address_line1"
    t.string    "coll_address_line2"
    t.string    "coll_landmark"
    t.string    "coll_city"
    t.string    "coll_state"
    t.string    "coll_country"
    t.string    "coll_pincode"
    t.text      "coll_full_address"
    t.string    "coll_primary_phone"
    t.string    "coll_additional_phone"
    t.decimal   "result_odd"
    t.decimal   "result_even"
    t.decimal   "result_aggregate"
    t.integer   "result_year"
    t.string    "course"
    t.string    "stream"
    t.decimal   "amount_fees"
    t.decimal   "amount_donation"
    t.decimal   "amount_bus_pass"
    t.decimal   "amount_add_on"
    t.decimal   "amount_total"
    t.string    "chalan_number"
    t.string    "vr_number"
    t.boolean   "books_given"
    t.string    "books_given_center"
    t.boolean   "camp_invited"
    t.boolean   "camp_attended"
    t.date      "camp_date"
    t.string    "camp_place"
    t.string    "fac_name"
    t.string    "fac_address_line1"
    t.string    "fac_address_line2"
    t.string    "fac_landmark"
    t.string    "fac_city"
    t.string    "fac_state"
    t.string    "fac_country"
    t.string    "fac_pincode"
    t.text      "fac_full_address"
    t.string    "fac_primary_phone"
    t.string    "fac_additional_phone"
    t.boolean   "letter1_sent"
    t.boolean   "letter2_sent"
    t.text      "comments"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "profession_type"
  end

end
