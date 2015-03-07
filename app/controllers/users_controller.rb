class UsersController < ApplicationController
  before_action :set_user

  def edit
    authorize! :update, @user
    @title = "Account"
  end

  def set_password
    authorize! :update, @user

    @user.update_attributes(user_params)
    @user.password_match?

    if @user.save
      sign_in(@user, bypass: true)
      render json: { redirect_link: edit_user_path(@user) }, status: :ok
    else
      render json: @user.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    authorize! :update, @user

    @title = "My Account"

    if user_params.has_key?(:password)
      if @user.update_with_password(user_params)
        sign_in(@user, bypass: true)
        redirect_to edit_user_path(@user), notice: "Password updated successfully."
      else
        render :edit
      end
    else
      if @user.update_without_password(user_params)
        redirect_to edit_user_path(@user), notice: "Account updated successfully."
      else
        render :edit
      end
    end
  end

  def url_options
    if current_user
      { resource_name: "users", subscriber_id: current_user.id }.merge(super)
    else
      super
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :avatar,
      :current_password,
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end

end
