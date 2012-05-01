class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 30.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :role, :donor_attributes

  # has_one :donor

  # accepts_nested_attributes_for :donor

  # Roles for the users
  # Only superadmin will have permission to add another super admin
  ROLES = %w[admin moderator general donor author banned]
  ROLESADM = %w[super_admin admin moderator general donor author banned]

  # Validate that email password and role is present for each user
  validates_presence_of :email, :role
  validates :email, :uniqueness => true
end

