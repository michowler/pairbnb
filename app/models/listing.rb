class Listing < ApplicationRecord

	serialize :photos, Array 
	mount_uploaders :photos, PhotoUploader

	belongs_to :user
	has_many :tags, through: :listing_tags
	has_many :listing_tags, :dependent => :destroy
	has_many :reservations, :dependent => :destroy

	enum place_type: [:guesthouse, :hotel, :apartment, :townhouse, :cabin, :house, :bungalow]

	def self.search(search)
	  #where("title LIKE ? OR tags LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
 	  where("location ilike ?", "%#{search}%")
	end
end
