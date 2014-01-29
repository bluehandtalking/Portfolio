ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "capybara-webkit"
require "turn/autorun"

# below for ping test
require 'timeout'
require 'socket'


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
    fill_in 'post_title', with: 'Code Fellows Portfolio'
    fill_in 'post_description', with: 'The Amazing Life of Web Developers'
    fill_in 'post_content', with: 'This is an example of how I merged with the goodness of Rails'
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

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end


def ping(host)
  begin
    Timeout.timeout(5) do 
      s = TCPSocket.new(host, 'echo')
      s.close
      return true
    end
  rescue Errno::ECONNREFUSED
    return true
  rescue Timeout::Error
    return false
  end
end

Turn.config.format = :outline

