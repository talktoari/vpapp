# Override the Devise Registation controller for the Sign Up Operation
class MyDevise::RegistrationsController < Devise::RegistrationsController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    super
    @donor = Donor.new
  end

  # After overriding the flow of methods are in this manner
  # Super = existing controller code
  # after_sign_up_path_for = Page goes to donors path
  # Donor save code = donor save happens
  # That's why edit donor path becomes nil since donor id is not yet available
  def create
    super
    # If user role is Donor then add new Donor
    if current_user.role == "donor"
      @donor = Donor.new
      @donor.email = current_user.email

      # Save donor data and redirect to donor show page
      # Cannot use redirect or render tags here
      if @donor.save
        flash[:notice] = "Donor Profile was successfully created."
      else
        flash[:alert] = "ERROR with Donor Profile creation. Try SignUp again"
      end
    end
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

