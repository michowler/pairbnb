class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  
  enum gender: [:undefined, :male, :females]

	def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
       u.full_name = auth_hash["info"]["name"]
       u.email = auth_hash["extra"]["raw_info"]["email"]
       
	     #user = User.create!(full_name: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"])
	     user.authentications << (authentication)      
       user.password = SecureRandom.hex(7)
    end  
	end

    def fb_token
      x = self.authentications.where(:provider => :facebook).first
      return x.token unless x.nil?
    end

    # def password_optional?
    #   true #if login with FB then true, else false
    # end 

end
