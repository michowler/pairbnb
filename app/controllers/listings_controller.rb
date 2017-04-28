class ListingsController < ApplicationController
	#before_action :require_login, only: [:new, :create]
	before_action :logged_in_user, only: [:new, :create]
	before_action :find_listing, only: [:show, :delete, :edit, :update]
	

	def index
	end
	
	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		#@listing.tag_ids = Listing.new(tag_ids: params[:listing][:tag_ids])
		# @listing.user_id = current_user.id
		byebug
		if @listing.save
			redirect_to @listing
		else
			render action: 'new'	
		end	
	end

	def update
       @listing.update(listing_params)
       @listing.user_id = current_user.id
       redirect_to @listing
	end

	def edit
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

	def listing_params
	    params.require(:listing).permit(:title, :description, :location, :place_type, :bedroom, :guest, :price, { :tag_ids => [] })
	end

	 # def require_login
	 #   unless logged_in?
	 #     flash[:error] = "You must be logged in to access this section"
	 #     redirect_to sign_in_path # halts request cycle
	 #   end
	 # end
end
