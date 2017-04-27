class PagesController < ApplicationController
  before_action :require_login, only: [:new]
   
  def index
  	 @listings = Listing.all
     @listing = Listing.new
  end

end