class HomeController < ApplicationController
  def index
    render :welcome, layout: 'fullwidth' and return unless logged_in?

    @companies = current_user.companies.uniq

    if @companies.count == 0
    	flash[:info] = "Time to create your company's profile"
	    redirect_to new_company_path and return
	  end
  end
end
