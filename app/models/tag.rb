class Tag < ApplicationRecord
	has_many :listings, through: :listing_tags
	has_many :listing_tags, :dependent => :destroy
	# enum tag_content: [:smoking, :wifi, :pets, :non_smoking, :non_wifi, :non_pets]
end


