class MainpageController < ApplicationController
  def index
      @restaurants = Review.all.reverse
      @top10 = @restaurants.sort { |a,b| b.avgrate <=> a.avgrate }.first(10)
      gon.restaurants = @restaurants.to_json
  end
end
