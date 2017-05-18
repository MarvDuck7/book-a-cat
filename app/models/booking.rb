class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat
  validates :book_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(Pending Accepted Canceled) }
  validates :review_content, presence: true, on: :update
  validates :review_rating, presence: true, on: :update
end
