# BookingsController
class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i(create index)
  before_action :set_booking, only: [:update]


  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render 'show'
    end
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

  private
  
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:id, :review_rating, :review_content)
  end
end
