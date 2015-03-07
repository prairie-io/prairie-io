module Authentication
  class RegistrationsController < Devise::RegistrationsController
    skip_authorization_check

    before_action :configure_permitted_parameters, if: :devise_controller?

    def create
      @title = "Join"
      super
    end

    def new
      @title = "Join"
      super
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:avatar, :name]
    end
  end
end
