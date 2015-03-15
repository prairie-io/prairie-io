class OrganizersController < ApplicationController
  respond_to :html

  skip_authorization_check
  layout "home"

  def create
    @title = "New Organizer"

    if current_user && current_user.is_admin
      @organizer = Organizer.create(organizer_params)

      respond_with @organizer
    else
      redirect_to root_path
    end
  end

  def index
    @organizers = Organizer.all
  end

  def new
    @title = "New Organizer"
    @organizer = Organizer.new

    unless current_user && current_user.is_admin
      redirect_to root_path
    end
  end

  def show
    @organizer = Organizer.find(params[:id])

    redirect_to @organizer.site_url if @organizer.site_url

    @title = @organizer.name
    @description = @organizer.description
  end

private

  def organizer_params
    params.require(:event).permit(
      :description,
      :logo,
      :name
    )
  end
end
