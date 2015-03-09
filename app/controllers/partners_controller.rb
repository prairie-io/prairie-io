class PartnersController < ApplicationController
  layout "home"
  skip_authorization_check

  def index
    @partners = Partner.all
    @title = "Partners"
  end
end
