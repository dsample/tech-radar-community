require 'acts_as_tenant'

class TenantController < ApplicationController
  set_current_tenant_through_filter
  before_filter :set_tenant

  layout 'tenant'

  def set_tenant
    if params[:company_slug]
      company = Company.find_by_slug(params[:company_slug])
      set_current_tenant(company)
    end

  	return nil
  end

  def default_url_options
    { company_slug: params[:company_slug]}
  end

end
