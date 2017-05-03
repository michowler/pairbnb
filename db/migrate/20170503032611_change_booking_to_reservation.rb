class ChangeBookingToReservation < ActiveRecord::Migration[5.0]
  def change
  	 rename_table :bookings, :reservations
  end
end
