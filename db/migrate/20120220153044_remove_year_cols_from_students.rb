class RemoveYearColsFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :coll_name
    remove_column :students, :coll_address_line1
    remove_column :students, :coll_address_line2
    remove_column :students, :coll_landmark
    remove_column :students, :coll_city
    remove_column :students, :coll_state
    remove_column :students, :coll_country
    remove_column :students, :coll_pincode
    remove_column :students, :coll_full_address
    remove_column :students, :coll_primary_phone
    remove_column :students, :coll_additional_phone
    remove_column :students, :result_odd
    remove_column :students, :result_even
    remove_column :students, :result_aggregate
    remove_column :students, :result_year
    remove_column :students, :course
    remove_column :students, :stream
    remove_column :students, :amount_fees
    remove_column :students, :amount_donation
    remove_column :students, :amount_bus_pass
    remove_column :students, :amount_add_on
    remove_column :students, :amount_total
    remove_column :students, :chalan_number
    remove_column :students, :vr_number
    remove_column :students, :books_given
    remove_column :students, :books_given_center
    remove_column :students, :camp_invited
    remove_column :students, :camp_attended
    remove_column :students, :camp_date
    remove_column :students, :camp_place
    remove_column :students, :fac_name
    remove_column :students, :fac_address_line1
    remove_column :students, :fac_address_line2
    remove_column :students, :fac_landmark
    remove_column :students, :fac_city
    remove_column :students, :fac_state
    remove_column :students, :fac_country
    remove_column :students, :fac_pincode
    remove_column :students, :fac_full_address
    remove_column :students, :fac_primary_phone
    remove_column :students, :fac_additional_phone
    remove_column :students, :letter1_sent
    remove_column :students, :letter2_sent
  end

  def down
    add_column :students, :letter2_sent, :boolean
    add_column :students, :letter1_sent, :boolean
    add_column :students, :fac_additional_phone, :string
    add_column :students, :fac_primary_phone, :string
    add_column :students, :fac_full_address, :text
    add_column :students, :fac_pincode, :string
    add_column :students, :fac_country, :string
    add_column :students, :fac_state, :string
    add_column :students, :fac_city, :string
    add_column :students, :fac_landmark, :string
    add_column :students, :fac_address_line2, :string
    add_column :students, :fac_address_line1, :string
    add_column :students, :fac_name, :string
    add_column :students, :camp_place, :string
    add_column :students, :camp_date, :date
    add_column :students, :camp_attended, :boolean
    add_column :students, :camp_invited, :boolean
    add_column :students, :books_given_center, :string
    add_column :students, :books_given, :boolean
    add_column :students, :vr_number, :string
    add_column :students, :chalan_number, :string
    add_column :students, :amount_total, :decimal
    add_column :students, :amount_add_on, :decimal
    add_column :students, :amount_bus_pass, :decimal
    add_column :students, :amount_donation, :decimal
    add_column :students, :amount_fees, :decimal
    add_column :students, :stream, :string
    add_column :students, :course, :string
    add_column :students, :result_year, :string
    add_column :students, :result_aggregate, :string
    add_column :students, :result_even, :string
    add_column :students, :result_odd, :string
    add_column :students, :coll_additional_phone, :string
    add_column :students, :coll_primary_phone, :string
    add_column :students, :coll_full_address, :text
    add_column :students, :coll_pincode, :string
    add_column :students, :coll_country, :string
    add_column :students, :coll_state, :string
    add_column :students, :coll_city, :string
    add_column :students, :coll_landmark, :string
    add_column :students, :coll_address_line2, :string
    add_column :students, :coll_address_line1, :string
    add_column :students, :coll_name, :string
  end
end
