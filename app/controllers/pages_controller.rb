class PagesController < ApplicationController
  before_action :require_login, only: [:new]
   
  def index
     @listing = Listing.new
     @tags = Tag.all
     @listings = Listing.all.paginate(:page => params[:page], :per_page => 2).order('id DESC')
  end

end