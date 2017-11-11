class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name neighborhood
                                                         city_state phone
                                                         account_type avatar
                                                         description address
                                                         address_number
                                                         address_detail
                                                         postal_code])
  end
end
