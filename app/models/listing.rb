class Listing < ApplicationRecord
	enum place_type: [:guesthouse, :hotel, :apartment, :townhouse, :cabin, :house, :bungalow]
end
