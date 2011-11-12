class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || donors_path
  end

  def after_sign_out_path_for(resource_or_scope)
    home_choosepage_path
  end

end

