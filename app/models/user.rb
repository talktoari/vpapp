class User < ActiveRecord::Base
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :donor_attributes
  
  has_one :donor
  
  accepts_nested_attributes_for :donor
  
  # Roles for the users
  ROLES = %w[admin moderator donor author banned]
  
end
