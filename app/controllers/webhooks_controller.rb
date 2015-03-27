class WebhooksController < ApplicationController
  skip_authorization_check
  
  def mailchimp
    if params[:data] && params[:data][:email]
      user = User.find_by(email: params[:data][:email])

      if user
        user.update_column(is_subscribed: false)
      end
    end

    render nothing: true
  end
end
