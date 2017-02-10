class Admins::AdministratorsController < SuperController

  def index
  end

  def edit
    @administrator = Admin.where(admin_id: params[:id]).first
  end
end
