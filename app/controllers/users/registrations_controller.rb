class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :create, resource
  end

  protected

  def after_sign_up_path_for(resource)
    #if current_user.role == "donor"
      #@donor = Donor.new
      #@donor = Donor.find(:first, :conditions => [ "email = ?", current_user.email])
      #edit_donor_path(@donor.id)
    #end
    donors_path
  end
end

