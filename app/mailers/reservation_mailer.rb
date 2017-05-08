class ReservationMailer < ApplicationMailer
    default from: "iammichellelerhsinyee@gmail.com"
	
	def booking_email(customer, host)
	  #host = listing.user #listing.reservation #parse in the email 
	  @customer = customer.user
	  @host = host.user
	  @url  = 'http://imingle.herokuapp.com'
	  mail(:to => @host.email, :subject => "Reservation")
	end
	
end
