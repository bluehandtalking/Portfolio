require 'test_helper'

feature "When visiting my new cool site, check to be sure we are on the right page" do
  scenario "User choses to navigate to your cool site" do
    visit ( "http://www.ironhorserails.com/" )
    page.must_have_content("Being Here")
  end
end


