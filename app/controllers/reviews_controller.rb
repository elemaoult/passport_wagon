class ReviewsController < ApplicationController
  def new
    @passport = Passport.find(params[:passport_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @passport = Passport.find(params[:passport_id])
    @review.user = current_user
    @review.passport = @passport
    authorize @review
    if @review.save
      redirect_to passport_path(@passport)
    else
      flash[:alert] = "Something went wrong."
      render 'passports/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
