class PagesController < ApplicationController

  skip_before_action :authenticate_user! 

  def home
  end

  def dashboard
    @user = User.all.sample
  end

  def search
    @passports = Passport.all
  end

  def legalspecs
  end

  def cookiesspecs
  end

  def persospecs
  end
end
