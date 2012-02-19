class CreateStudentDonationLinks < ActiveRecord::Migration
  def change
    create_table :student_donation_links do |t|
      t.integer :student_id
      t.integer :donation_id
      t.string :linked_by
      t.string :comment

      t.timestamps
    end
  end
end
