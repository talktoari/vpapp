class FixDonationColumnName < ActiveRecord::Migration
  def change
    rename_column :donations, :type, :donation_type
  end
end

