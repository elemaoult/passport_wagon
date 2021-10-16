class AddCommentsToPassports < ActiveRecord::Migration[6.1]
  def change
    add_column :passports, :comment, :text
  end
end
