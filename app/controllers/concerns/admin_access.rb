module AdminAccess
  extend ActiveSupport::Concern

  included do
    before_action :validate_admin_subdomain
    before_action :authenticate
  end

private

  def authenticate
    authenticate_admin!
  end

  # Super administration access is only permissible on the ariki subdomain.
  # If any attempted access to a route from any subdomain other than ariki
  # is made then a 404 should be fired. We do not want
  def validate_admin_subdomain
    #raise ActionController::RoutingError.new('Not Found') unless request.subdomains.first == 'manage'
  end

end
