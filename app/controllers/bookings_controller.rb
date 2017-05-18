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
    date = Date.parse(session[:date])
    @cat = Cat.find(params[:cat_id])
    @book = Booking.new(
      user_id: current_user.id,
      cat_id: params[:cat_id],
      book_date: date
    )
    if @book.save
      redirect_to bookings_path
    else
      redirect_to @cat
    end
  end
end
