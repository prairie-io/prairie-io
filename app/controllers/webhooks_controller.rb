class WebhooksController < ApplicationController
  def mailchimp
    user = User.find_by(email: params[:data][:email])

    if user
      user.update_column(is_subscribed: false)
    end

    render nothing: true
  end
end
