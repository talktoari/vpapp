class Student < ActiveRecord::Base
  # Student has many yearly details
  has_many :yearly_details, :dependent => :destroy

  # First Name and Last name needed for Donors which should be unique
  validates_presence_of :first_name, :last_name
  validates :vp_id, :uniqueness => { :scope => [:first_name, :last_name]}

  # Search first and last name together for reporting and filtering
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||', parent.table[:first_name], ' '),
      parent.table[:last_name])
  end

end

