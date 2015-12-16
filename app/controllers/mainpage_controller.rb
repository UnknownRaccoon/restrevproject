class MainpageController < ApplicationController
  def index
      @restaurants_pg = Review.page(params[:page]).per(3)
      @restaurants = Review.all.reverse
      @top10 = @restaurants.sort { |a,b| b.avgrate <=> a.avgrate }.first(10)
      gon.restaurants = @restaurants.to_json
  end
end
