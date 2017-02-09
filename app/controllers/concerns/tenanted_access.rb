module TenantedAccess
  extend ActiveSupport::Concern

  included do
    before_action :identify_tenant
  end

  # Helper preceedes all processing of the action and determines the current
  # tenant (Account). All actions are related to a tenant.
  def identify_tenant

    # extract all subdomains from the request
    subdomains = request.subdomains.dup

    # identify target subdomain as the first in the list of subdomains
    target_subdomain = subdomains.shift
    protocol = request.protocol

    # locate the base domain for the current environment
    base_domain = ENV["GIZMO_BASE_DOMAIN"]


    if request.domain == base_domain
      @current_tenant = Account.where(subdomain: target_subdomain).first
    elsif request.host.include?("localhost")
      @current_tenant = Account.default_account
    else
      @current_tenant = Account.where(custom_domain: request.host).first
    end

    if @current_tenant
      Account.current = @current_tenant
      Account.current_subdomains = request.subdomains
      Account.current_port = request.port
      Account.current_protocol = protocol
    else
      # We do not know where the request was intended for - redirect to safe URI
      redirect_to "http://www.paranet.com"
    end


  end # def identify_tenant

end # module
