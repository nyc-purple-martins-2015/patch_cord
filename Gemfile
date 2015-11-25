ruby '2.2.3'
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'


# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

 gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
  gem 'pg', '~> 0.15'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5.0'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.0'
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', group: :doc

  gem 'httparty'
  gem 'geokit-rails'


  # Use ActiveModel has_secure_password
  gem 'bcrypt', '~> 3.1.7'
  gem 'omniauth-twitter', '~> 1.2', '>= 1.2.1'
  gem 'omniauth-soundcloud', '~> 1.0', '>= 1.0.1'
  gem "omniauth-google-oauth2"

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'byebug'
  gem 'pry-rails'
  gem 'rspec-rails'

group :production do
  gem 'rails_12factor'
end

end

