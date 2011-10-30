class AddAnonymousToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :anonymous, :boolean
  end
end
