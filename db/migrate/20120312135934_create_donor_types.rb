class CreateDonorTypes < ActiveRecord::Migration
  def change
    create_table :donor_types do |t|
      t.string :donor_type

      t.timestamps
    end
  end
end
