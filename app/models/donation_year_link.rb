class DonationYearLink < ActiveRecord::Base

  belongs_to :donation
  belongs_to :yearly_detail

end

