require 'test_helper'

feature "Accessing the site in roles of visitor, author, or editor to allow different create permissions ans show different post status" do
  scenario "Visitor navigates to the new_post_path" do
    # Given a visitor attempts to create a new post 
    visit new_post_path
    # Then the message is displayed to sign in, preventing unauthorized posting
    page.must_have_content "You need to sign in or sign up before continuing"
  end
  scenario "An author visits the new_post_path" do
    # This brings up the sign in page where she fills out the sign in form
    sign_in(:author)
    # fill_in 'Email', with: 'alvindude@example.com'    
    # fill_in 'Password', with: 'secretpwd49' 
    page.find("[type='submit']").click 
  end
end
