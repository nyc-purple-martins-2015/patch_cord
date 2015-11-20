Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "Azhjvai3CTJK2E22uRiOCZNls", "gx7Kzk16VThZPPwhtWq8cTk7HBH2a5pmhuCFpGa1wxQI8XfwkM"
    {
          :secure_image_url => 'true',
          :image_size => 'original',
          :authorize_params => {
            :force_login => 'true',
            :lang => 'pt'
          }
        }
end
