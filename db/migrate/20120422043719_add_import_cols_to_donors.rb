class AddImportColsToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :ser_no, :string
  end
end
