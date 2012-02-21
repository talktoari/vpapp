class YearlyDetail < ActiveRecord::Base

  # Yearly Detail can be linked to multiple donations
  has_many :donation_year_links
  has_many :donations, :through => :donation_year_links, :dependent => :destroy

  # Yearly Detail belongs to Student
  belongs_to :student
end

