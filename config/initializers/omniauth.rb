Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TW_API_KEY"], ENV["TW_API_SECRET"]
    {
      secure_image_url:  "true",
      image_size:  "original",
      authorize_params:  {
        force_login:  "true",
        lang:  "en"
      }
    }

  provider :soundcloud, ENV["SC_API_KEY"], ENV["SC_API_SECRET"]
    {
      :name => "soundcloud"
    }

  provider OmniAuth::Strategies::GoogleOauth2, ENV["GG_API_KEY"], ENV["GG_API_SECRET"]
    {
      :name => "google",
      :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end
