class PassportsController < ApplicationController
  before_action :set_passport, only: [:show]

  def index
    if params[:brand].present?
      @passports = Passport.where("brand_name ILIKE ?", "%#{params[:brand]}%").and(Passport.where("gender ILIKE ?", "%#{params[:gender]}%"))     
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
    @user = User.find(params[:user_id])
    @passport.user = @user
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
    params.require(:passport).permit(:social_security_number, :country, :gender, :brand_name, :price_per_day)
  end

end
