class AddAvailabilityDateToPassports < ActiveRecord::Migration[6.1]
  def change
    add_column :passports, :avaibility_date, :date
  end
end
