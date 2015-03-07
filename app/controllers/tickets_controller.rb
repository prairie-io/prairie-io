class TicketsController < ApplicationController
  skip_authorization_check

  before_action :set_event, only: [:create, :quick_attend]
  before_action :set_user, only: [:create, :quick_attend]

  def create
    if current_user
      @ticket = Ticket.where(user: current_user, event: @event).first_or_initialize

      authorize! :create, @ticket

      if @ticket.save
        redirect_to event_path(@event), notice: "Thanks! We'll see you there."
      end
    else
      store_location_for(:user, quick_attend_event_tickets_path(@event))

      redirect_to new_user_session_path, alert: "You need to sign in or sign up before continuing."
    end
  end

  def quick_attend
    if current_user
      @ticket = Ticket.where(user: current_user, event: @event).first_or_initialize

      authorize! :create, @ticket

      if @ticket.save
        redirect_to event_path(@event), notice: "Thanks! We'll see you there."
      end
    else
      store_location_for(:user, quick_attend_event_tickets_path(@event))

      redirect_to new_user_session_path, alert: "You need to sign in or sign up before continuing."
    end
  end

private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_user
    if params[:user_hex]
      user = User.find_by_hex(params[:user_hex])

      sign_in(user)
    end
  end
end
