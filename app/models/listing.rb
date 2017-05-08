class Listing < ApplicationRecord
	#include PgSearch

	serialize :photos, Array 
	mount_uploaders :photos, PhotoUploader

	belongs_to :user
	has_many :tags, through: :listing_tags
	has_many :listing_tags, :dependent => :destroy
	has_many :reservations, :dependent => :destroy

	enum place_type: [:guesthouse, :hotel, :apartment, :townhouse, :cabin, :house, :bungalow]

	#scope :search, -> (search, min, max) { where("location ilike ? AND price < ? AND price > ?", "%#{search}%", max, min) }

	def self.search(search, min, max)	 
 	  where("location ilike ? AND price < ? AND price > ?", "%#{search}%", max, min) 
	end
end
