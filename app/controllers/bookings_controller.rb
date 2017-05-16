class BookingsController < ApplicationController
  before_action :set_bookings, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:create]

  def index
  end

  def new
  end

  def create
    cat = Cat.find(params["cat_id"])
    Booking.create(user_id: current_user.id, cat_id: cat.id)
    byebug
  end
  # cat.book_date = session[:date]

  def destroy
  end

  def show
  end

  private

  def bookings_params
  end

  def set_bookings
    #optimized query
    # @bookings = Cocktail.includes(doses: :ingredient).find(params[:id])

  end

end
