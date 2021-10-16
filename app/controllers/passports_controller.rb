class PassportsController < ApplicationController
  before_action :set_passport, only: [:show]
  skip_before_action :authenticate_user! , only: [:show, :index]

  def index
    if params[:brand].present?
      @passports = Passport.where("brand_name ILIKE ?", "%#{params[:brand]}%").and(Passport.where("gender ILIKE ?", "%#{params[:gender]}%"))
    # Question to ask. How to deal with filtering scope policy
    else
      @passports = policy_scope(Passport).order(created_at: :desc)
      # @passports = Passport.all
    end
  end

  def show
    authorize @passport
  end

  def new
    @passport = Passport.new
    authorize @passport
  end

  def create
    @passport = Passport.new(passport_params)
    @passport.user = current_user
    authorize @passport
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
