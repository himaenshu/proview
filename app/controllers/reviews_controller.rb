class ReviewsController < ApplicationController

	def index
		@reviews = Review.find_by_project_id(params[:project_id])
	end	

	def show
		get_review
		@project = @review.project
		@risks = @review.risks
		@recommendations = @review.recommendations
	end

	def new
		@review = Review.new(:project_id => params[:project_id])
		render partial: "form", :locals => {review: @review}, layout: false
	end	

	def edit
		get_review
		render partial: "form", :locals => {review: @review}, layout: false
	end

	def create
    @review = Review.new(review_params)
    @review.save
  end

  def update
    @review = Review.find_by_id(params[:id])
    @review.update_attributes(review_params)
  end

	private

	def get_review
		@review = Review.find_by_id(params[:id])
	end	

	def review_params
    params.require(:review).permit(:project_id, :category, :reviewed_on, :summary)
  end	

end
