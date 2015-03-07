class Activity < Struct.new(:object, :name, :description, :image_url, :date, :type)
end

class ActivitiesController < ApplicationController
  respond_to :html

  skip_authorization_check
  layout "home"

  # GET /events
  def index
    @title = "Events"

    activities = []
    types = params[:types] ? params[:types].map(&:downcase).map(&:to_sym) : [:event, :user]

    activities += Event.published.map do |event|
      Activity.new(event, event.name, event.description, event.logo.url(:thumb), event.localized_starts_at, :event)
    end if types.include?(:event)

   activities += User.published.map do |user|
     Activity.new(user, "#{user.name} joined the herd", nil, user.avatar.url(:thumb), user.created_at, :user)
   end if types.include?(:user)

    # descending sort by 'date' field
    @activities = activities.sort_by(&:date).reverse

    respond_with @activities
  end
end
