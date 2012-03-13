class CreateDonationPurposes < ActiveRecord::Migration
  def change
    create_table :donation_purposes do |t|
      t.string :donation_purpose

      t.timestamps
    end
  end
end
