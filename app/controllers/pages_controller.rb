class PagesController < ApplicationController
  before_action :require_login, only: [:new]
   
  def index
  	 @user = User.new
     @listing = Listing.new
     @tags = Tag.all
     @listings = Listing.all.paginate(:page => params[:page], :per_page => 6).order('id DESC')
  end

end