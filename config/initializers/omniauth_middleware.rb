Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],
  {
    :authorize_params => {
      :force_login => 'true'
    } 
  }  	
end
# See https://github.com/arunagw/omniauth-twitter for more options
