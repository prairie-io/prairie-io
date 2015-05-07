module Authentication
  class SessionsController < Devise::SessionsController
    skip_authorization_check
    after_filter :track_login, only: :create

    def create
      @title = "Login"
      super
    end

    def new
      @title = "Login"
      super
    end

    def track_login
      if current_user
        Analytics.track(
          user_id: "#{current_user.id}",
          event: "Logged In"
        )
      end
    end
  end
end
