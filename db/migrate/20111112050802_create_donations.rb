class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donor_id
      t.integer :student_id
      t.decimal :amount
      t.string :status
      t.string :type
      t.text :comment

      t.timestamps
    end
  end
end
