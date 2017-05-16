# BookingsController
class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @book = Booking.new(
      user_id: current_user.id,
      cat_id: params[:cat_id],
      book_date: session[:date]
    )
    if @book.save
      redirect_to cat_bookings_path
    else
      redirect_to @cat
    end
  end
end
