class MainpageController < ApplicationController
  def index
      @restaurants = Review.all.reverse
      @rs = Review.page(params[:page]).per(3)
      respond_to do |format|
         format.html {}
         format.js {}
      end
      @top10 = @restaurants.sort { |a,b| b.avgrate <=> a.avgrate }.first(10)
      gon.restaurants = @restaurants.to_json
  end

    def search
        if (params[:search]) and (params[:search]!="")
            @srch = Review.search_in_text(params[:search]).page(params[:page]).per(3)
        else
            @srch = Review.page(params[:page]).per(3)
        end
       respond_to do |format|
       format.html {redirect_to root_path}
       format.js {}
    end
  end
end
