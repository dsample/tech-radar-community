require 'acts_as_tenant'

class TenantController < ApplicationController
  set_current_tenant_through_filter
  before_filter :authenticate_user!
  before_filter :set_tenant

  helper_method :has_permission_to?

  layout 'tenant'

  def set_tenant
    render :not_found, layout: 'application', status: :not_found and return unless params[:company]
    
    company = current_user.companies.find_by_slug(params[:company])

    render :not_found, layout: 'application', status: :not_found and return if company.blank?

    set_current_tenant(company)
  end

  def has_permission_to?(do_something)
    has_permission = current_user.permissions.where(slug: ['manage_company', do_something]).present?
    unless has_permission
      flash[:error] = 'You do not have permission to do that'

      respond_to do |format|
        format.html { redirect_to tenant_root_path }
        format.json { head :no_content }
      end
    end
    return has_permission
  end

  def default_url_options
    { company: current_tenant }.merge(super)
  end
end
