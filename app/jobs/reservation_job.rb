class ReservationJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later

  # end

  def perform(l, r)
  	# ReservationMailer.booking_email(l, r)
  	# @listing = Listing.find(params[:listing_id])
  	# @reservation = current_user.reservations.new(reservation_params)
  	# @reservation.listing = @listing
  	# @mail = mail
    # do something
  end
end


