class TagsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
	before_action :find_tag, only: [:show, :delete, :edit, :update]

	def index
		@show_tag = Tag.all
		@tags = Tag.all
		@tag = Tag.new
	end
	
	def new
		@tag = Tag.new
	end

	def create
		@listing = Listing.find(params[:id])
		@tag = Tag.new(tag_params)
		
		if @tag.save
			redirect_to @listing
		else
			"ERROR"
			render root_path	
		end	
	end

	def destroy
		@tag.destroy
		redirect_to listings_path
	end

	def show
		@tags = Tag.all
	end

	private 
	def find_tag
		@tag = Tag.find(params[:tag_id])
	end

	def tag_params
	    params.require(:tag).permit(:tag_content)
	end

end
