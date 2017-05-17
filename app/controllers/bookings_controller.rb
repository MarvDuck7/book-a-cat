class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
  end

  def new
  end

  def create
    @cat = Cat.find(params["cat_id"]) #ask teacher
    @book = Booking.new(user_id: current_user.id, cat_id: params["cat_id"], book_date: session[:date])
    if @book.save
      redirect_to cat_path(@cat)
    else
      redirect_to cat_path(@cat)
    end
  end

  def destroy
  end

  def show
  end

end
