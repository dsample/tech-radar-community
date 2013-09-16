class UserCompanyRolesController < TenantController
  before_filter {has_permission_to? 'manage_permissions'}

  def create
  	@user = User.find(params[:user])
    @role = Role.find(params[:role])

    respond_to do |format|
      if @user.roles << @role
        flash[:success] = 'Role assignment successful'
        format.html { redirect_to roles_path }
        format.json { render head :no_content, status: :created, location: roles_path }
      else
      	flash[:success] = 'Role assignment failed'
        format.html { redirect_to roles_path }
        format.json { render head :no_content, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end
end
