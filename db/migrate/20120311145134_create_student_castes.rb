class CreateStudentCastes < ActiveRecord::Migration
  def change
    create_table :student_castes do |t|
      t.string :caste_name

      t.timestamps
    end
  end
end
