class PagesController < ApplicationController
  def home

  end

  def dashboard
    @user = User.all.sample
  end

  def search
    @passports = Passport.all
  end
end
