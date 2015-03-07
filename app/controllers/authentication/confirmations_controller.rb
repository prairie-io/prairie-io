module Authentication
  class ConfirmationsController < Devise::ConfirmationsController
    skip_authorization_check

    def show
      super do |resource|
        sign_in(resource) if resource.errors.empty?
      end
    end

  private

    def after_confirmation_path_for(resource_name, resource)
      stored_location_for(:user) || edit_user_path(resource)
    end
  end
end
