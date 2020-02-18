class ReviewsController < ApplicationController

	def index
		@hotel = Hotel.find(params[:hotel_id])
		@reviews = @hotel.reviews
	end


	def new
		@hotel = Hotel.find(params[:hotel_id])
		@review = Review.new
	end

	def create
		@hotel = Hotel.find(params[:hotel_id])
		@review = Review.new(review_params)
		if @review.save
			redirect_to hotel_reviews_path(@hotel)
		end
	end

	def show
		@hotel = Hotel.find(params[:hotel_id])
		@review = Review.find(params[:id])
	end

	def destroy
		@hotel = Hotel.find(params[:hotel_id])
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to hotel_reviews_path(@hotel)
	end

	def review_params
		params.require(:review).permit(:name, :title, :rating, :body, :hotel_id)
	end

end
