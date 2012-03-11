class CreateStudentStudyMeds < ActiveRecord::Migration
  def change
    create_table :student_study_meds do |t|
      t.string :medium_name

      t.timestamps
    end
  end
end
