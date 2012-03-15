class CreateStudentDistricts < ActiveRecord::Migration
  def change
    create_table :student_districts do |t|
      t.string :district

      t.timestamps
    end
  end
end
