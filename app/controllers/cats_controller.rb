class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    cats = Cat.where("address ILIKE '%#{params[:cat][:address]}%'")
    @cats = cats.select { |cat| available_for?(cat, params[:cat][:date]) }
    @date = session[:date] = params[:cat][:date]
  end

  def show
    @bookings = Booking.new
  end

  def available_for?(cat, date)
    available = true
    if cat.bookings.any?
      cat.bookings.each do |booking|
        available = false if booking.book_date == date
      end
    end
    available
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
