class ListingsController < ApplicationController
	#before_action :require_login, only: [:new, :create]
	before_action :logged_in_user, only: [:new, :create]
	before_action :find_listing, only: [:show, :delete]
	

	def index
		@listings = Listing.all
		@listing = Listing.new
	end
	
	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(list_params)
		if @listing.save
			redirect_to @listing
		else
			render action: 'new'	
		end	
	end

	def destroy
		@listing.destroy
		redirect_to listings_path
	end

	def show
		@listings = Listing.all
	end

	private 
	def find_listing
		@listing = Listing.find(params[:id])
	end

	def list_params
	    params.require(:listing).permit(:user, :title, :description, :place_type, :bedroom, :guest, :price)
	end

	 # def require_login
	 #   unless logged_in?
	 #     flash[:error] = "You must be logged in to access this section"
	 #     redirect_to sign_in_path # halts request cycle
	 #   end
	 # end
end
