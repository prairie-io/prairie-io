module Authentication
  class Mailer < Devise::Mailer
    self.asset_host = "http://" + ENV["ASSET_HOST"]

    include Roadie::Rails::Automatic

    add_template_helper(ApplicationHelper)

    default from: "Prairie I/O <#{ENV["DEVISE_EMAIL_FROM"]}>"
    layout "email"

    def confirmation_instructions(record, token, opts={})
      @token = token
      @user  = record

      mail(
        to:      @user.email,
        subject: "Please confirm your account"
      )
    end

    def invitation_instructions(record, token, opts={})
      @token = token
      @user  = record

      mail(
        to:      @user.email,
        subject: "You've been invited to join Prairie I/O"
      )
    end

    def reset_password_instructions(record, token, opts={})
      @token = token
      @user  = record

      mail(
        to:      @user.email,
        subject: "Reset Password Instructions"
      )
    end

    def unlock_instructions(record, token, opts={})
      @token = token
      @user  = record

      mail(
        to:      @user.email,
        subject: "Unlock Instructions"
      )
    end
  end
end
