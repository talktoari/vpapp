class CreateYearlyDetailYears < ActiveRecord::Migration
  def change
    create_table :yearly_detail_years do |t|
      t.integer :year

      t.timestamps
    end
  end
end
