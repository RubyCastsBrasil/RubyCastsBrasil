source 'https://rubygems.org'

ruby "#{File.new('.ruby-version').gets}"

gem 'rails', '4.1.4'

# Authentication and Authorization
gem 'cancancan'
gem 'rolify'
gem 'devise'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-linkedin-oauth2'

# Helpers
gem 'responders'
gem 'simple_form', '>= 3.1.0.rc1'
gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'nyan-cat-formatter'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'poltergeist'
  gem 'shoulda-matchers', require: false
  gem 'spring-commands-rspec'
end

group :development do
  gem 'letter_opener'
  gem 'better_errors'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
