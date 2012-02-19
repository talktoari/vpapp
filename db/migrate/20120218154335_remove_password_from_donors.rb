class RemovePasswordFromDonors < ActiveRecord::Migration
  def up
    remove_column :donors, :password
  end

  def down
    add_column :donors, :password, :string
  end
end
