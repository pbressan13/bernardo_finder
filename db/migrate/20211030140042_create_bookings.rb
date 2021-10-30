class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.decimal :total_price
      t.integer :duration
      t.date :book_date
      t.boolean :accepted
      t.integer :rating

      t.timestamps
    end
  end
end
