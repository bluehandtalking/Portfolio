require 'test_helper'

feature "A visitor comes to the site and signs up for a new account so I can perform actions allowed to a registered user" do
  let(:auth_test) {AuthTest.new}
  scenario " Visitor goes to sign up page and enters name, email, password, password_confirmation" do
    # Given a registration form
    visit "/users/sign_up"
    click_link "Sign up"
    # When I register with valid info
    fill_in 'Email', with: 'john@lighthouse.com'
    # fill_in 'Password', with: users(:chill).encrypted_password  
    fill_in 'Password', with: 'password' 

    fill_in 'Password confirmation', with: 'password'
    # click_button "Sign up"
    page.find("[type='submit']").click 
    # Then I should be signed up
    page.must_have_content( 'Welcome! You have signed up successfully' )
   # page.should_have_selector ".notice", text: "Signed in successfully" 
    page.wont_have_content( 'You can not sign in as Zorro' )
  end
end
