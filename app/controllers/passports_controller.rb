class PassportsController < ApplicationController
  before_action :set_passport, only: [ :show ]

  def index
    @passports = Passport.all
  end

  def show
    @passports = set_passport 
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
    Passport.find(params[:passport_id])
  end

  def passport_params
    params.require(:passport).permit(:social_security_number, :country, :gender, :brand_name, :price_per_day)
  end

end