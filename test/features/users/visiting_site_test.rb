require 'test_helper'

feature "Visiting my new cool site, check to be sure we are on the right page" do
  scenario "User choses to navigate to your cool site" do
    visit  root_path 
    page.must_have_content("Being Here")
  end
end


