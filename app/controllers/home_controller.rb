class HomeController < ApplicationController
  layout "home"
  skip_authorization_check

  def about
    @title = "About"
  end

  def index
    @title = "Welcome"
  end

  def partners
    @title = "Partners"
  end
end
