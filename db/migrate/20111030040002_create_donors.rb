class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :email
      t.string :password
      t.string :gender
      t.date :date_of_birth
      t.string :address_first_line
      t.string :address_second_line
      t.string :address_landmark
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :phone
      t.string :mobile
      t.text :comment

      t.timestamps
    end
  end
end
