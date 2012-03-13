class CreateDonationTypes < ActiveRecord::Migration
  def change
    create_table :donation_types do |t|
      t.string :donation_type

      t.timestamps
    end
  end
end
