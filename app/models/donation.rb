class Donation < ActiveRecord::Base

  # Donation can be linked to multiple yearly details
  has_many :donation_year_links
  has_many :yearly_details, :through => :donation_year_links, :dependent => :destroy

  # Donation belongs to donor
  belongs_to :donor
end

