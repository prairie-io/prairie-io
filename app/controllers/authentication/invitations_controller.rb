module Authentication
  class InvitationsController < Devise::InvitationsController
    skip_authorization_check

    def edit
      @title = "Join"
      super
    end

    def update
      @title = "Join"
      super
    end

  protected

    def update_resource_params
      params.require(resource_name).permit(:avatar, :email, :invitation_token, :name, :password)
    end
  end
end
