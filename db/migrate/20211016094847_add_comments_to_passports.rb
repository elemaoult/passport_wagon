class AddCommentsToPassports < ActiveRecord::Migration[6.1]
  def change
    add_column :passports, :comments, :text
  end
end
