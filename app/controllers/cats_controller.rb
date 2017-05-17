class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.near(params[:cat][:address], 20)
               .select { |cat| available_for?(cat, params[:cat][:date]) }
  end

  def show
    @bookings = Booking.new
  end

  def available_for?(cat, date)
    available = true
    if cat.bookings.any?
      cat.bookings.each do |booking|
        if booking.book_date == date
          available = false
          break
        end
      end
    end
    available
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
