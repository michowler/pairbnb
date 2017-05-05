class ReservationsController < ApplicationController

	before_action :logged_in_user, only: [:create]

	def show
		@reservation = Reservation.find(params[:id])
		@listing = Listing.find(params[:listing_id])
	end	

	 def create
	   @listing = Listing.find(params[:listing_id])
	   @reservation = current_user.reservations.new(reservation_params)
	   @reservation.listing = @listing

	   if @reservation.save
	   	 #ExampleMailer.sample_email(reservation).deliver_now
	   	 ReservationMailer.booking_email(@listing, @reservation).deliver_now
	     redirect_to listing_reservation_path(@listing, @reservation)
	   else
	     flash[:notice] = @reservation.errors.full_messages.join('. ')
	     redirect_to listing_path(@listing)
	   end
	 end

	 def destroy
	   @reservation = Reservation.find(params[:id])
	   @reservation.destroy
	   redirect_to @reservation.user
	 end

	 def reservation_params
	   params.require(:reservation).permit(:num_guests, :start_date, :end_date)
	 end
	 
end
