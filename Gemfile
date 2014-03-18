source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'pg'  
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'  
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'  
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'rack-contrib', '1.1.0'
gem 'devise'
gem 'bcrypt-ruby', '~>3.1.2'
gem "foundation-rails", github: "codefellows/foundation-rails"
gem 'pundit'
gem 'omniauth-twitter'
gem 'figaro'

group :doc do
  gem 'sdoc', require: false # bundle exec rake doc:rails generates the API under doc/api. 
end

group :production do
  gem 'rails_12factor', github: "heroku/rails_12factor"
  gem 'unicorn'
  gem 'newrelic_rpm' 
end


group :development do
  gem 'sqlite3'
  gem 'binding_of_caller', github: "banister/binding_of_caller" # This needs to go in before better_errors
  gem 'better_errors'
  gem 'meta_request', '0.2.1'
  gem 'pry-rails'
  gem 'thin'
end

group :test do 
  gem 'minitest-rails'
  gem 'minitest-rails-capybara', github: "blowmage/minitest-rails-capybara"
  gem 'capybara-webkit'
  gem 'turn'
  gem 'simplecov', :require => false
  gem 'debugger', "1.6.5"
  gem 'pry-debugger', github: 'nixme/pry-debugger'
  gem 'pry-rescue'
end

ruby "2.1.0"
