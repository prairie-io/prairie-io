module Authorization
  class ApplicationsController < ApplicationController
    skip_authorization_check

    before_filter :set_application, only: [:show, :edit, :update, :destroy]

    def new
      @application = current_user.applications.new
    end

    def create
      @application = current_user.applications.new(application_params)
      if @application.save
        flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :create])
        redirect_to edit_oauth_application_url(@application), notice: "Application created successfully."
      else
        render :new
      end
    end

    def update
      if @application.update_attributes(application_params, owner: current_user)
        flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :update])
        redirect_to edit_user_path(current_user), notice: "Application updated successfully."
      else
        render :edit
      end
    end

    def destroy
      flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :destroy]) if @application.destroy
      redirect_to edit_user_path(current_user), notice: "Application deleted successfully."
    end

  private

    def set_application
      @application = current_user.applications.find(params[:id])
    end

    def application_params
      params.require(:application).permit(:name, :home_url, :logo, :redirect_uri)
    end
  end
end
