class FixDataTypeForYearlyDetails < ActiveRecord::Migration
  def up
    change_column :yearly_details, :year, :integer
    change_column :yearly_details, :result_odd, :decimal, :precision => 4, :scale => 2
    change_column :yearly_details, :result_even, :decimal, :precision => 4, :scale => 2
    change_column :yearly_details, :result_aggregate, :decimal, :precision => 4, :scale => 2
    change_column :yearly_details, :result_year, :integer
  end

  def down
    change_column :yearly_details, :year, :string
    change_column :yearly_details, :result_odd, :string
    change_column :yearly_details, :result_even, :string
    change_column :yearly_details, :result_aggregate, :string
    change_column :yearly_details, :result_year, :string
  end
end

