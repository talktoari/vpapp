class FixDataTypeForStudents < ActiveRecord::Migration
  def up
    change_column :students, :total_family_income, :decimal, :precision => 12, :scale => 2
    change_column :students, :sslc_percentage, :decimal, :precision => 4, :scale => 2
  end

  def down
    change_column :students, :total_family_income, :string
    change_column :students, :sslc_percentage, :string
  end
end

