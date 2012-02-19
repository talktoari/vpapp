class Student < ActiveRecord::Base
  has_many :student_donation_links
  has_many :donations, :through => :student_donation_links, :dependent => :destroy
end

