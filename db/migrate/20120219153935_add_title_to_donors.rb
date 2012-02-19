class AddTitleToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :title, :string
  end
end
