class CreateYearlyDetails < ActiveRecord::Migration
  def change
    create_table :yearly_details do |t|
      t.integer :student_id
      t.integer :year
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
      t.decimal :result_odd, :precision => 4, :scale => 2
      t.decimal :result_even, :precision => 4, :scale => 2
      t.decimal :result_aggregate, :precision => 4, :scale => 2
      t.integer :result_year
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

