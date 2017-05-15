class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true
      t.date :book_date

      t.timestamps
    end
  end
end
