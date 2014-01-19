ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "turn/autorun"

class ShowPosts
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
  def build_post
    fill_in 'post_title', with: 'Code Rails'
    fill_in 'post_description', with: 'The Amazing Life of Web Developers'
    fill_in 'post_content', with: 'This is an example of how I merged with the goodness of Rails'
  end
end

class EditPostPage
  include Capybara::DSL
  def visit_index_page
    visit '/posts'
    self
  end
  def visit_show_page
    visit '/posts/1'
    self
  end    
  def fill_fields
    fill_in "post_title", with: "Fishing for Blackmouth"
    fill_in "post_description", with: "How to hook the big ones"
    fill_in "post_content", with: "Winter fishing for blackmouth is a great sport in th Pacific Northwest"
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end

Turn.config.format = :outline

