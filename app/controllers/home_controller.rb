class HomeController < ApplicationController
  def index
    render :welcome, layout: 'fullwidth' unless logged_in?
  end
end
