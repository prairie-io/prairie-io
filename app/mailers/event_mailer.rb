class EventMailer < ActionMailer::Base
  self.asset_host = "http://" + ENV["ASSET_HOST"]

  include Roadie::Rails::Automatic
  include Sidekiq::Mailer

  add_template_helper(ApplicationHelper)

  default from: "Prairie I/O <#{ENV["DEVISE_EMAIL_FROM"]}>"
  layout "email"

  def invitation(event_id, user_id)
    @event = Event.find(event_id)
    @user = User.find(user_id)

    if @user.is_subscribed && !@user.attending?(@event)
      mail to: @user.email, subject: "You're invited to #{@event.name}!"
    end
  end
end
