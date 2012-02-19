class StudentDonationLink < ActiveRecord::Base
  belongs_to :student
  belongs_to :donation
end

