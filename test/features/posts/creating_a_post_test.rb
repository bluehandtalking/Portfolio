require 'test_helper'

feature "Accessing the site in roles of visitor, author, or editor to allow different create permissions and show different post status" do
  scenario "Visitor attempts to go to new_post_path, but is unable to do so" do
    # Given a visitor attempts to create a new post 
    visit root_path
    # Then the message is displayed to sign in, preventing unauthorized posting
    page.must_have_content "Being Here"
    # Then visitor attempts to navigate to new_post_path but is returned to root_path
    visit new_post_path
    page.has_no_content?  "New post"
  end
  scenario "An author signs in and then visits the new_post_path" do
    visit root_path
    fill_in "Title" , with: 'New Horizons'
    fill_in "Description" , with: 'Traveling to the End of Time'
    fill_in "Content ", with: 'A long voyage will always end where it began'
    # page.find("[type='submit']").click 
    click_on "Create Post"
    visit new_post_path
    page.must_have_content "New post"

  end
end
