class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat
  validates :book_date, presence: true
end
