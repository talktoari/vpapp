class CreateDonationYearLinks < ActiveRecord::Migration
  def change
    create_table :donation_year_links do |t|
      t.integer :donation_id
      t.integer :yearly_detail_id
      t.string :linked_by
      t.decimal :linked_amount, :precision => 12, :scale => 2
      t.text :comments

      t.timestamps
    end
  end
end

