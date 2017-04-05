Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['tw_api_key'], ENV['tw_api_secret'], 
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end
