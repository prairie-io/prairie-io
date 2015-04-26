class HomeController < ApplicationController
  layout "home"
  skip_authorization_check

  def about
    @title = "About"
  end

  def index
    @title = "Welcome"
  end

  def roost
    render layout: false
  end

  def roost_manifest
    render json: { gcm_user_visible_only: true, gcm_sender_id: 576352449549 }.to_json
  end

  def partners
    @title = "Partners"
  end
end
