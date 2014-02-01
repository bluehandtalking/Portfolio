require 'test_helper'

feature "Allow a user who is signed in to be able to sign out" do
  scenario "A user is on the home page, signs in, and then signs out" do
    # Given a user is signed in
    # Then the user signs out
    # log_in
    visit "/users/sign_in"
    fill_in 'user_email', with: "chillwill@example.com" 
    fill_in 'Password', with: "secretpwd49"

    # click_button "Sign in"
    page.find("[type='submit']").click 
    # page.must_have_content( "Signed in successfully" )
    # click_link "Sign out"
  end
end
