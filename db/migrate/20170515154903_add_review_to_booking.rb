class AddReviewToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :review_content, :text
    add_column :bookings, :review_rating, :integer
  end
end
