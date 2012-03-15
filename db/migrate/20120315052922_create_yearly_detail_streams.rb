class CreateYearlyDetailStreams < ActiveRecord::Migration
  def change
    create_table :yearly_detail_streams do |t|
      t.string :stream

      t.timestamps
    end
  end
end
