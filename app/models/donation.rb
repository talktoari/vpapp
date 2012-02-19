class Donation < ActiveRecord::Base
  has_many :student_donation_links
  has_many :students, :through => :student_donation_links, :dependent => :destroy
  belongs_to :donor
end

