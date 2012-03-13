class CreateDonorTitles < ActiveRecord::Migration
  def change
    create_table :donor_titles do |t|
      t.string :donor_title

      t.timestamps
    end
  end
end
