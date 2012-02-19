class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :district
      t.string :taluka
      t.string :vp_id
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.date :date_of_birth
      t.string :email
      t.string :pmt_address_line1
      t.string :pmt_address_line2
      t.string :pmt_landmark
      t.string :pmt_city
      t.string :pmt_state
      t.string :pmt_country
      t.string :pmt_pincode
      t.text :pmt_full_address
      t.string :cur_address_line1
      t.string :cur_address_line2
      t.string :cur_landmark
      t.string :cur_city
      t.string :cur_state
      t.string :cur_country
      t.string :cur_pincode
      t.text :cur_full_address
      t.string :primary_phone
      t.string :additional_phone
      t.string :father_occupation
      t.string :mother_occupation
      t.string :total_family_income
      t.string :gender
      t.string :area_type
      t.string :caste
      t.string :category
      t.string :studied_medium
      t.string :sslc_percentage
      t.string :coll_name
      t.string :coll_address_line1
      t.string :coll_address_line2
      t.string :coll_landmark
      t.string :coll_city
      t.string :coll_state
      t.string :coll_country
      t.string :coll_pincode
      t.text :coll_full_address
      t.string :coll_primary_phone
      t.string :coll_additional_phone
      t.string :result_odd
      t.string :result_even
      t.string :result_aggregate
      t.string :result_year
      t.string :course
      t.string :stream
      t.decimal :amount_fees, :precision => 10, :scale => 2
      t.decimal :amount_donation, :precision => 10, :scale => 2
      t.decimal :amount_bus_pass, :precision => 10, :scale => 2
      t.decimal :amount_add_on, :precision => 10, :scale => 2
      t.decimal :amount_total, :precision => 12, :scale => 2
      t.string :chalan_number
      t.string :vr_number
      t.boolean :books_given
      t.string :books_given_center
      t.boolean :camp_invited
      t.boolean :camp_attended
      t.date :camp_date
      t.string :camp_place
      t.string :fac_name
      t.string :fac_address_line1
      t.string :fac_address_line2
      t.string :fac_landmark
      t.string :fac_city
      t.string :fac_state
      t.string :fac_country
      t.string :fac_pincode
      t.text :fac_full_address
      t.string :fac_primary_phone
      t.string :fac_additional_phone
      t.boolean :letter1_sent
      t.boolean :letter2_sent
      t.text :comments

      t.timestamps
    end
  end
end

