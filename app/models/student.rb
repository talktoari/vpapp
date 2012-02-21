class Student < ActiveRecord::Base
  # Student has many yearly details
  has_many :yearly_details, :dependent => :destroy
end

