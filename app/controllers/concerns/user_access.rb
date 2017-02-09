module UserAccess
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  def authenticate
    authenticate_user!
  end

end
