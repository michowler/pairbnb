class ListingsController < ApplicationController
	#before_action :require_login, only: [:new, :create]
	before_action :logged_in_user, only: [:new, :create]
	before_action :find_listing, only: [:show, :delete, :edit, :update]
	

	def index
		#@form_listing = ListingFindForm.new(params.require(:listing_find_form))
		@show_tag = Tag.all
	end

	def index
	  @listings = Listing.all
	  if params[:search]
	    @listings = Listing.search(params[:search], params[:min], params[:max]).order("created_at DESC")
	  else
	    @listings = Listing.all.order("created_at DESC")
	  end
	end
	
	def new
		if current_user.customer? == false
	        flash[:notice] = "Sorry. You are not allowed to perform this action."
	        return redirect_to root_path, notice: "Sorry. You do not have the permissino to verify a property."
		else 
			@listing = Listing.new
		end	
	end

	def create
		@listing = current_user.listings.new(listing_params)
		#@listing.tag_ids = Listing.new(tag_ids: params[:listing][:tag_ids])
		# @listing.user_id = current_user.id
		if @listing.save
			redirect_to @listing
		else

			redirect_to @listing, notice: "Sorry. Listing not saved."
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
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to @listing.user
	end

	def show
		@user
		@listings = Listing.all
		@reservation = @listing.reservations.new
	end

	def find
	    @form_listing = ListingFindForm.new
	  end

	private 
	def find_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
	    params.require(:listing).permit(:title, :description, :location, :place_type, :bedroom, :guest, :price, {:tag_ids => []}, {:photos => []})
	end

	 # def require_login
	 #   unless logged_in?
	 #     flash[:error] = "You must be logged in to access this section"
	 #     redirect_to sign_in_path # halts request cycle
	 #   end
	 # end
end
