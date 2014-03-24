source 'https://rubygems.org'

def on_heroku?
  ENV['DYNO']
end

# Don't break multiple ruby versions in travis just because heroku requires a specific one
if on_heroku?
  ruby "1.9.3"
end

gem 'rails', '4.0.3'

gem 'pg'
gem 'slim'
gem 'attr_extras'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# Push support
gem 'faye-websocket'
gem 'redis'
gem 'thin'

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
end
