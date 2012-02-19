class AddPurposeToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :purpose, :string
  end
end
