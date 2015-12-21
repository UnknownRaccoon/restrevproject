class MainpageController < ApplicationController
  def index
      @restaurants = Review.all.reverse
      @rs = Review.page(params[:page]).per(3)
      respond_to do |format|
         format.html {}
        #  format.json { render :partial => "mainpage/rest.json"  }
         format.js {}
        # gon.watch.rs = @rs.to_json
         #format.json {render json: @rs}
      end
      @top10 = @restaurants.sort { |a,b| b.avgrate <=> a.avgrate }.first(10)
      gon.restaurants = @restaurants.to_json
  end
end
