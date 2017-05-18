class PagesController < ApplicationController
  def home
    if user_signed_in?
      @number_of_pending_requests = 0
      cats = current_user.cats
      cats.each do |cat|
        @number_of_pending_requests += cat.bookings.where("status = ?", "Pending").count
      end
    end
  end
end
