class SubscriptionsController < ApplicationController
  skip_authorization_check

  before_action :set_user, only: [:unsubscribe]

  def unsubscribe
    authorize! :edit, current_user

    current_user.update(is_subscribed: false)

    if current_user.save
      redirect_to edit_user_path(current_user), notice: "We won't bug you again. Sorry!"
    end
  end

private

  def set_user
    if params[:user_hex]
      user = User.find_by_hex(params[:user_hex])

      sign_in(user)
    end
  end
end
