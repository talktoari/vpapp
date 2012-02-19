class AddDistrictToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :district, :string
  end
end
