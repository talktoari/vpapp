class CreateDonationStatuses < ActiveRecord::Migration
  def change
    create_table :donation_statuses do |t|
      t.string :donation_status

      t.timestamps
    end
  end
end
