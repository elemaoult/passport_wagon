class ApplicationRecord < ActiveRecord::Base
  # before_action :authenticate_user!, only: :home
  self.abstract_class = true
end
