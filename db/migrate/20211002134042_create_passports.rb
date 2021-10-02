class CreatePassports < ActiveRecord::Migration[6.1]
  def change
    create_table :passports do |t|
      t.string :social_security_number
      t.string :country
      t.string :gender
      t.string :brand_name
      t.decimal :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
