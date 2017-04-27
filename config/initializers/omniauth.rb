Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], 
  :scope => 'email', 
  :display => 'page', 
  :info_fields => 'name, email, gender'
end