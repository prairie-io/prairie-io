class HomeController < ApplicationController
  layout "home"
  skip_authorization_check

  def index
    @title = "Welcome"
  end
end
