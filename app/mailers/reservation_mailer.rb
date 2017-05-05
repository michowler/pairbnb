class ReservationMailer < ApplicationMailer
    default from: "iammichellelerhsinyee@gmail.com"
	
	def booking_email(customer, host)
	  @url  = 'localhost:3000'
	  #host = listing.user #listing.reservation #parse in the email 
	  @customer = customer.user
	  @host = host.user
	  mail(:to => @host.email, :subject => "Reservation")
	end
	
end
