Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter ENV["TW_API_KEY"], ENV["TW_API_SECRET"],
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end
