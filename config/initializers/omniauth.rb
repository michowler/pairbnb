Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], 
  :scope => 'email, user_birthday, user_location', 
  :display => 'page', 
  :info_fields => 'name, email, birthday'
end