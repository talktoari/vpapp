class Donor < ActiveRecord::Base
  has_many :donations, :dependent => :destroy

  validates_presence_of :first_name, :last_name
  validates :first_name, :uniqueness => { :scope => :last_name}
end

