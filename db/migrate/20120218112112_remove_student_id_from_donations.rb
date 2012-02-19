class RemoveStudentIdFromDonations < ActiveRecord::Migration
  def up
    remove_column :donations, :student_id
  end

  def down
    add_column :donations, :student_id, :integer
  end
end
