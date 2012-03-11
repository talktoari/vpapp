class CreateStudentCategories < ActiveRecord::Migration
  def change
    create_table :student_categories do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
