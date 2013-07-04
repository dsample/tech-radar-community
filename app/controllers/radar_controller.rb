class RadarController < ApplicationController
  def index
  	@categories = Category.includes(:technologies).where(:technologies => {:deleted_at => nil}).select{ |x| x.technologies.count > 0 }
  end
end