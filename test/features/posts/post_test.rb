require 'test_helper'

feature "Accessing the site in roles of visitor, author, or editor to allow different create permissions and show different post status" do
  scenario "Visitor attempts to go to new_post_path, but is unable to do so" do
    # Given a visitor attempts to create a new post 
    visit root_path
    # Then the message is displayed to sign in, preventing unauthorized posting
    page.must_have_content "Being Here"
    # Then visitor attempts to navigate to new_post_path but is returned to root_path
    visit new_post_path
    page.wont_have_content  "New post"
  end
  scenario "An author signs in and then visits the new_post_path" do
    sign_in("author")
    visit new_post_path
    page.must_have_content "New post" 
    page.fill_in "post_title" , with: 'New Horizons'
    page.fill_in "Description" , with: 'Traveling to the End of Time'
    page.fill_in "post_content", with: 'A long voyage will always end where it began'
    click_on "Create Post"
    page.must_have_content "New Horizons"

  end
end
