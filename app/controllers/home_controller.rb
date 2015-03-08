class HomeController < ApplicationController
  layout "home"
  skip_authorization_check

  def index
    @title = "Welcome"
  end

  def sponsors
    @title = "Sponsors"
  end
end
