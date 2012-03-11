class CreateStudentParentOccupations < ActiveRecord::Migration
  def change
    create_table :student_parent_occupations do |t|
      t.string :occupation_name

      t.timestamps
    end
  end
end
