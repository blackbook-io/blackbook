class Admins::AccountsController < SuperController
  def index
    @accounts = Account.all
  end

  def edit
    
  end
end
