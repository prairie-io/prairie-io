class EventsController < ApplicationController
  respond_to :html

  skip_authorization_check
  layout "home"

  def create
    @title = "New Event"

    if current_user && current_user.is_admin
      @event = Event.create(event_params)

      respond_with @event
    else
      redirect_to root_path
    end
  end

  def new
    @title = "New Event"
    @event = Event.new

    unless current_user && current_user.is_admin
      redirect_to root_path
    end
  end

  # GET /events
  def show
    @event = Event.find(params[:id])
    @title = @event.name
    @description = @event.description

    respond_with @event
  end

private

  def event_params
    params.require(:event).permit(
      :address1,
      :address2,
      :city,
      :description,
      :description_html,
      :ends_at,
      :is_attendable,
      :location_description,
      :logo,
      :name,
      :organizer_id,
      :starts_at,
      :state,
      :zipcode
    )
  end
end
