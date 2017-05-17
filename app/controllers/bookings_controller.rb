# BookingsController
class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i(create index)

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @book = Booking.new(
      user_id: current_user.id,
      cat_id: params[:cat_id],
      book_date: session[:date]
    )
    if @book.save
      redirect_to bookings_path
    else
      redirect_to @cat
    end
  end
end
