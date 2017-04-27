class ListingsController < ApplicationController
	#before_action :require_login, only: [:new, :create]
	before_action :find_listing, only: [:show, :delete]
	

	def index
		@listings = Listing.all
		@listing = Listing.new
	end
	
	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(url_params)
		if @listing.save
			redirect_to root_path
		else
			render 'index'	
		end	
	end

	def destroy
		@listing.destroy
		redirect_to listings_path
	end

	def show
	end

	private 
	def find_listing
		@listing = Listing.find(params[:id])
	end

	def url_params
	    params.require(:listing).permit(:user, :title, :description, :place_type, :bedroom, :guest, :price)
	end

	 # def require_login
	 #   unless logged_in?
	 #     flash[:error] = "You must be logged in to access this section"
	 #     redirect_to sign_in_path # halts request cycle
	 #   end
	 # end
end
