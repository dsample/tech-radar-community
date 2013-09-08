class RadarController < ApplicationController
  def index
  	render :welcome, layout: 'fullwidth' unless logged_in?
  	@categories = Category.includes(:technologies).where(:technologies => {:deleted_at => nil}).select{ |x| x.technologies.count > 0 }
  	render :newradar if @categories.empty?
  end
end