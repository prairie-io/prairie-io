module Authorization
  class AuthorizationsController < Doorkeeper::AuthorizationsController
    layout "application"

    def new
      @title = "Authorize #{pre_auth.client.name}"
      super
    end
  end
end
