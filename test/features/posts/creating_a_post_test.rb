require 'test_helper'

feature "Accessing the site in roles of visitor, author, or editor to allow different create permissions ans show different post status" do
  scenario "Visitor attempts to go to new_post_path, but is unable to do so" do
    # Given a visitor attempts to create a new post 
    visit root_path
    # Then the message is displayed to sign in, preventing unauthorized posting
    page.must_have_content "Being Here"
    # Then visitor attempts to navigate to new_post_path but is returned to root_path
    visit new_post_path
    page.has_no_content?  "New post"
  end
  scenario "An author visits the new_post_path" do
    # This brings up the sign in page where she fills out the sign in form
    sign_in(:author)
    # fill_in 'Email', with: 'alvindude@example.com'    
    # fill_in 'Password', with: 'secretpwd49' 
    page.find("[type='submit']").click 
  end
end
