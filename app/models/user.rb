class User < ApplicationRecord
  include Clearance::User
  
  enum gender: [:undefined, :male, :females]

	def self.create_with_auth_and_hash(authentication, auth_hash)
	     user = User.create!(full_name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
	     user.authentications << (authentication)      return user
	end

    def fb_token
      x = self.authentications.where(:provider => :facebook).first
      return x.token unless x.nil?
    end

end
