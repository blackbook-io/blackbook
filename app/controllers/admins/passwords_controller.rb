class Admins::PasswordsController < Devise::PasswordsController

  layout 'devise_admins'

  include AppAccess
  
end
