class ReviewsController < ApplicationController
    before_filter :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
    def new
        @review = Review.new
        gon.restaurant = @review
    end

    def edit
        @review = Review.find(params[:id])
        gon.restaurant = @review
    end

    def show
        @review = Review.find(params[:id])
        gon.restaurant = @review
    end

    def create
        @review = Review.new(review_params)
        gon.restaurant = @review
        if @review.save
            redirect_to @review
        else
            render 'new'
        end
    end

    def update
        @review = Review.find(params[:id])
        gon.restaurant = @review
        if @review.update(review_params)
            redirect_to @review
        else
            render 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to root_path
    end

    private
        def review_params
            params.require(:review).permit(:name, :review, :address, :x, :y, :mark1, :mark2, :mark3, :comment, :indexKeyWords, photos: [])
        end
end
