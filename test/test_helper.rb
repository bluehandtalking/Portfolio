require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "capybara-webkit"
require 'capybara/dsl'
require 'devise'
require "turn/autorun"



Capybara.default_driver = :webkit

class IndexPosts
  include Capybara::DSL
  def visit_page
    visit '/posts'
    self
  end  
end

class NewPostPage
  include Capybara::DSL
  def visit_page
    visit '/posts/new'
    self
  end
  def visit_index_page
    visit '/posts'
    self
  end
  def fill_post
    fill_in 'Title', with: 'Code Fellows Portfolio'
    fill_in 'Description', with: 'The Amazing Life of Web Developers'
    fill_in 'Content', with: 'This is an example of how I merged with the goodness of Rails'
  end
end

class EditPostPage
  include Capybara::DSL
  def fill_fields
    fill_in "post_title", with: "Fishing for Blackmouth"
    fill_in "post_description", with: "How to hook the big ones"
    fill_in "post_content", with: "Winter fishing for blackmouth is a great sport in th Pacific Northwest"
  end
  def visit_index_page
    visit '/posts'
  end
end


class NewProjectPage
  include Capybara::DSL
  def visit_page
    visit '/projects/new'
    self
  end
  def build_project
    fill_in 'project_name', with: "Code Fellows Portfolio" 
  end
end

class EditProjectPage
  include Capybara::DSL
  def fill_fields
    fill_in "project_name", with: "Whidbey Island Watershed stewards"
  end
  def visit_index_page
    visit '/projects'
  end
end

class ActiveSupport::TestCase
  fixtures :all
end


class FeatureTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end

def sign_in(role = :editor)
  visit '/users/sign_in'
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'secretpwd49'
  page.all(:link,"Sign in")[0].click 
end

def log_in
  visit root_path
  click_link "Sign in"
  fill_in 'Email', with: users(:chill).email
  fill_in 'Password', with: 'secretpwd' 
end     



Turn.config.format = :outline

