class CreateStudentTalukas < ActiveRecord::Migration
  def change
    create_table :student_talukas do |t|
      t.string :taluka

      t.timestamps
    end
  end
end
