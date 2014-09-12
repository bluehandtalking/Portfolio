require 'test_helper'

feature "Allow a user who is signed in to be able to sign out" do
  scenario "A user is on the home page, signs in, and then signs out" do
    # Given a user is signed in
    # Then the user signs out
    visit new_user_session_path
    fill_in 'Email', with: "chillwill@example.com" 
    fill_in 'Password', with: "secretpwd49"
    page.find("[type='submit']").click 
    page.must_have_content( "Signed in as" )
    click_link "Sign out"
    page.must_have_content("Sign in")
  end
end
