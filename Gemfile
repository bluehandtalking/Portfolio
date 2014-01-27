source 'https://rubygems.org'

gem 'rails', '4.0.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails' 
gem 'pg' # Use sqlite3 as the database for Active Record 
gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets 
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets 
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views 
gem 'jquery-rails' # Use jquery as the JavaScript library 
gem 'turbolinks'
gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder 
gem 'rack-contrib', '1.1.0'

gem 'bcrypt-ruby', '~>3.1.2'
gem "foundation-rails", github: "codefellows/foundation-rails"

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api. 
end

group :development do
  gem 'unicorn'
  gem 'binding_of_caller', github: "banister/binding_of_caller" # This needs to go in before better_errors
  gem 'better_errors'
  gem 'meta_request', '0.2.1'
end

group :test do 
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'ansi', "~> 1.4.3" #required by factory_girl_rails
  gem 'turn'
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'guard-minitest'
end

ruby "2.1.0"
