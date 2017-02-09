class TenantedController < ApplicationController
  include TenantedAccess
  include UserAccess
end
