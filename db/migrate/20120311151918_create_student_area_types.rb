class CreateStudentAreaTypes < ActiveRecord::Migration
  def change
    create_table :student_area_types do |t|
      t.string :area_type_name

      t.timestamps
    end
  end
end
