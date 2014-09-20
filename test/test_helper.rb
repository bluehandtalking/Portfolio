# Remove for Travis CI
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "capybara-webkit"
require 'capybara/dsl'
# require 'devise'
require "turn/autorun"



Capybara.default_driver = :webkit

class ActiveSupport::TestCase
  fixtures :all
end

# Make all database transactions use the same thread
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

# Examples of using Page Object pattern
class ProjectPage
  include Capybara::DSL
  def build_project
    fill_in 'Name', with: "Code Fellows Portfolio" 
    fill_in 'Description', with: "A wonderful expression in creativity"
    fill_in 'Content', with: "A Code Fellows portfolio demonstrates the chops of a Code Fellows professional"
  end
end

class EditPostPage
  include Capybara::DSL
  def fill_fields
    fill_in "post_title", with: "Fishing for Blackmouth"
    fill_in "post_description", with: "How to hook the big ones"
    fill_in "post_content", with: "Winter fishing for blackmouth is a great sport in th Pacific Northwest"
  end
end

def sign_in(role )
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'secretpwd49'
  click_on "Submit"
end

Turn.config.format = :outline
