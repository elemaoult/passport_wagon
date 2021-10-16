class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :passport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
