class AddDonorTypeToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :donor_type, :string
  end
end
