class Ability
  include CanCan::Ability


  def initialize(user)
    @user ||= user

    if @user
      # ------------------------------------------
      # User Permissions
      # ------------------------------------------

      can :manage, User, id: @user.id

      # ------------------------------------------
      # Ticket Permissions
      # ------------------------------------------

      can :manage, Ticket, user_id: @user.id
    end
  end

end
