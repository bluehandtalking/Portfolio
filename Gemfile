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
gem 'figaro', github: "laserlemon/figaro"
gem 'json', '1.8.1'

gem 'komments'
gem 'impressionist'

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
  # gem 'better_errors'
  gem 'meta_request', '0.2.1'
  # Below version of pry must be used for pry-editline to work
  gem 'pry', github: 'pry/pry', tag: "v0.9.12.6"
  gem 'pry-rails', github: 'pry/pry-rails'
  gem 'pry-doc', github: 'pry/pry-doc'
  gem 'pry-editline', github: "tpope/pry-editline"
  gem 'pry-theme', github: "kyrylo/pry-theme", tag: "v1.1.3"
  gem 'pry-debugger', github: 'nixme/pry-debugger'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'hirb'
  gem 'thin'
  # enable ctags to find methods in gems
  gem 'guard'
  gem 'guard-ctags-bundler'
end
 
gem 'minitest', '4.7.5'

group :test do 
  gem 'minitest-rails'
  gem 'minitest-rails-capybara', github: "blowmage/minitest-rails-capybara"
  gem 'capybara-webkit'
  gem 'turn'
  gem 'simplecov', :require => false
  gem 'debugger', "1.6.5"
end

# Below create a Seg Fault when using pry and attempting to open editor
# Uncomment before pushing to Heroku
ruby '2.1.0'
