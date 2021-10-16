class PassportsController < ApplicationController
  before_action :set_passport, only: [:show]

  def index
    if params[:brand].present?
      @passports = Passport.where("brand_name ILIKE ?", "%#{params[:brand]}%").and(Passport.where("gender ILIKE ?", "%#{params[:gender]}%")).and(Passport.where("availability_date LIKE ?" , "%#{params[:availability_date]}%"))
    else
      @passports = Passport.all
    end
  end

  def show
  end

  def new
    @passport = Passport.new
  end

  def create
    @passport = Passport.new(passport_params)
    @passport.user = current_user
    if @passport.valid?
      @passport.save
      redirect_to passport_path(@passport)
    else
      render :new
    end
  end

  private

  def set_passport
    @passport = Passport.find(params[:id])
  end

  def passport_params
    params.require(:passport).permit(:social_security_number, :country, :gender, :brand_name, :price_per_day, :photo)
  end

end
