class TicketMailer < ActionMailer::Base
  self.asset_host = "http://" + ENV["ASSET_HOST"]

  include Roadie::Rails::Automatic
  include Sidekiq::Mailer

  add_template_helper(ApplicationHelper)

  default from: "Prairie I/O <#{ENV["DEVISE_EMAIL_FROM"]}>"
  layout "email"

  def confirmation(ticket_id)
    @ticket = Ticket.find(ticket_id)
    @event = @ticket.event
    @user = @ticket.user

    mail to: @user.email, subject: "See you at #{@event.name}!"
  end

  def reminder(ticket_id)
    @ticket = Ticket.find(ticket_id)
    @event = @ticket.event
    @user = @ticket.user

    mail to: @user.email, subject: "#{@ticket.event.name} is tomorrow!"
  end
end
