class PassportsController < ApplicationController
  before_action :set_passport, only: [:show]

  def index
    @passports = Passport.all

    if params[:brand].present?
      @passports = @passports.where("brand_name ILIKE ?", "%#{params[:brand]}%")
    end

    if params[:gender].present?
      @passports = @passports.where("gender ILIKE ?", "%#{params[:gender]}%")
    end

    if params[:avaibility_date].present?
      @passports = @passports.where("avaibility_date >= ?" , params[:avaibility_date])
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
    params.require(:passport).permit(:social_security_number, :country, :gender, :brand_name, :price_per_day, :photo, :comments)
  end

end
