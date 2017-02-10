class DirectorController < ApplicationController
  def index
    subdomains = request.subdomains.dup

    # identify target subdomain as the first in the list of subdomains
    target_subdomain = subdomains.shift

    if target_subdomain == 'app'
      redirect_to admins_dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
