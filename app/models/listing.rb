class Listing < ApplicationRecord
	#include PgSearch

	serialize :photos, Array 
	mount_uploaders :photos, PhotoUploader

	belongs_to :user
	has_many :tags, through: :listing_tags
	has_many :listing_tags, :dependent => :destroy
	has_many :reservations, :dependent => :destroy

	enum place_type: [:guesthouse, :hotel, :apartment, :townhouse, :cabin, :house, :bungalow]

	#scope :locations, -> (location) { where("location ilike ?", "#{search}%") }
	#scope :prices, -> (price) { where ("price ilike ?", "#{price}%") }

	def self.search(search, min, max)
	  #Listing.where('location LIKE :search OR price LIKE :search OR console LIKE :search', search: "%#{search}%")	
	  #where("title LIKE ? OR tags LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
 	  where("location ilike ? AND price < ? AND price > ?", "%#{search}%", max, min) 
	end
end
