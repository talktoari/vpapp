class AddImportColsToYearlyDetails < ActiveRecord::Migration
  def change
    add_column :yearly_details, :profession_type, :string
  end
end
