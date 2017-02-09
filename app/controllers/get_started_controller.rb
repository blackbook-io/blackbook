class GetStartedController < TenantedController
  layout 'entry'

  # Displays the getting started page for a user with basic
  # user privilieges (ie not an owner)
  def user
  end # def user

  # Displays the getting started page for a user with owner
  # privileges.
  def owner
  end # def owner

  # Performs the acknlowledgement of the getting started landing
  # page as an owner of an account.
  def ack_owner
    current_user.update_attribute :ack_get_started_owner, true
    redirect_to root_path
  end # def ack_owner

  # Performs the acknlowledgement of the getting started landing
  # page as an user of an account.
  def ack_user
    current_user.update_attribute :ack_get_started_user, true
    redirect_to root_path
  end # def ack_user

end # class GetStartedController
