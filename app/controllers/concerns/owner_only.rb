module OwnerOnly
  extend ActiveSupport::Concern

  included do
    before_action :restrict_to_owners
  end


  private

  def restrict_to_owners
    unless Account.owners(Account.current).include? current_user
      # redirect to something
    end
  end

end
