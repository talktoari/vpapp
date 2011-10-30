class AddLastNameToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :last_name, :string
  end
end
