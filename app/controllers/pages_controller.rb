class PagesController < ApplicationController
  before_action :require_login, only: [:new]
   
  def index
     @listing = Listing.new
     @listings = Listing.all.paginate(:page => params[:page], :per_page => 3).order('id DESC')
  end

end