class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.date :rental_start
      t.date :rental_end
      t.text :rental_review
      t.references :passport, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
