class MainpageController < ApplicationController
  def index
      @restaurants = Review.all
      gon.restaurants = @restaurants.to_json
  end
end
