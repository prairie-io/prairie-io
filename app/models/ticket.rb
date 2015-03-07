class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  after_create :send_confirmation_email

  def send_confirmation_email
    TicketMailer.confirmation(self.id).deliver
  end
end
