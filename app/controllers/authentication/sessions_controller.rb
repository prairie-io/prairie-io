module Authentication
  class SessionsController < Devise::SessionsController
    skip_authorization_check

    def create
      @title = "Login"
      super
    end

    def new
      @title = "Login"
      super
    end
  end
end
