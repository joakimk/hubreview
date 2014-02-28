source 'https://rubygems.org'

def on_heroku?
  ENV['DYNO']
end

# Don't break multiple ruby versions in travis just because heroku requires a specific one
ruby "1.9.3" if on_heroku?

gem 'rails', '4.0.3'

gem 'pg'
gem 'slim'
gem 'attr_extras'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end
