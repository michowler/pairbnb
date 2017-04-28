# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = '123123'


ActiveRecord::Base.transaction do
  20.times do 
    user['full_name'] = Faker::Name.first_name 
    user['age'] = rand(1..70)
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['description'] = Faker::Hipster.sentence
    listing['place_type'] = ["guesthouse", "hotel", "apartment", "townhouse", "cabin", "house", "bungalow"].sample
    listing['bedroom'] = rand(1..6)
    listing['guest'] = rand(1..10)
    listing['location'] = Faker::Address.street_address
    listing['price'] = rand(80..500)
    listing['tag_ids'] = rand(1..6)
    

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end