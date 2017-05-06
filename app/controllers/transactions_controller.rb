class TransactionsController < ApplicationController
	# before_action :check_cart!

	def new
	  @client_token = Braintree::ClientToken.generate
	  @reservation = Reservation.find(params[:rid])
	end

	def checkout
	  reservation = Reservation.find(params[:rid])
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   #:amount => session[:total_price]
	   :amount => reservation.total_price, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  
	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :alert => "Transaction failed. Please try again." }
	  end 
	end

    # private
    # def check_cart!
    #   if current_user.reservations.blank?
    #     redirect_to root_url, alert: "Please add a booking date before processing your transaction!"
    #   end
    # end

end
