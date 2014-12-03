require 'test_helper'

feature "Visiting my new cool site, check to be sure we are on the right page" do
  scenario "User choses to navigate to your cool site" do
    visit  new_user_registration_path 
    page.must_have_content("Password confirmation")
  end
end


