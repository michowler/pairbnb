class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
 
  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :reservations, :dependent => :destroy

  enum status: [:customer, :superadmin, :moderator]
  enum gender: [:undefined, :male, :female]

  #validates_format_of :email, :with => /^[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i

	def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
       u.full_name = auth_hash["info"]["name"]
       u.email = auth_hash["extra"]["raw_info"]["email"]
       u.gender = auth_hash["extra"]["raw_info"]["gender"]
	     #user = User.create!(full_name: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"])
	     u.authentications << (authentication)      
       u.password = SecureRandom.hex(7)
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
