class CreateYearlyDetailCourses < ActiveRecord::Migration
  def change
    create_table :yearly_detail_courses do |t|
      t.string :course

      t.timestamps
    end
  end
end
