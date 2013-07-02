class RadarController < ApplicationController
  def index
  	@categories = Category.all(include: :technologies).select{ |x| x.technologies.count > 0 }
  end
end