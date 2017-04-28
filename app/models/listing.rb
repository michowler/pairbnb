class Listing < ApplicationRecord
	has_many :tags, through: :listing_tags
	has_many :listing_tags, :dependent => :destroy
	enum place_type: [:guesthouse, :hotel, :apartment, :townhouse, :cabin, :house, :bungalow]
end
