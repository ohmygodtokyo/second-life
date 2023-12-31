class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Another way authenticate users access to certain pages without using skip_before_action
  # before_action :authenticate_user!, except: [:home]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  # This method will redirect users to products index page after signing in. 
  def after_sign_in_path_for(resource)
    products_path # Change "products_path" to the path of your products index page
  end
end
