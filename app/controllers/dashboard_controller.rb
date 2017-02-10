class DashboardController < TenantedController
  
  before_action :present_getting_started

  def index

  end

  private

  # Filter determines if the user should be presented with the
  # getting started view. If the current user is the owner then
  # the action will determine if they have previously acknowledged the
  # screen. If not it will be shown. Similarly if the current
  # user is just a user.
  def present_getting_started

    if current_user.is_owner?
      redirect_to(getting_started_path) unless current_user.ack_get_started_owner
    else
      redirect_to(get_started_path) unless current_user.ack_get_started_user
    end

  end

end # class DashboardController
