class AddImportColsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :ser_no, :string
    add_column :students, :cet_rank, :string
    add_column :students, :exam_ticket_number, :string
    add_column :students, :account_number, :string
    add_column :students, :atm_number, :string
    add_column :students, :house_visited_by, :string
    add_column :students, :last_year_donor, :string
    add_column :students, :present_year_donor, :string
  end
end
