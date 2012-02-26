class Donor < ActiveRecord::Base
  # Donor has many donations
  has_many :donations, :dependent => :destroy

  # First Name and Last name needed for Donors which should be unique
  validates_presence_of :first_name, :last_name
  validates :first_name, :uniqueness => { :scope => :last_name}

  # Pagination
  paginates_per 5

  # Search first and last name together for reporting and filtering
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||', parent.table[:first_name], ' '),
      parent.table[:last_name])
  end

end

