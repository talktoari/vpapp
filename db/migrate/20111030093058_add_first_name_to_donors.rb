class AddFirstNameToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :first_name, :string
  end
end
