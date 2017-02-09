module AppAccess
  extend ActiveSupport::Concern

  included do
    before_action :validate_app_subdomain
  end


  private

  def validate_app_subdomain
    unless request.subdomains.first == 'app'
      redirect_to subdomain: 'app'
    end
  end

end
