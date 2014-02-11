feature "Allow a new user to sign up so she can make posts" do
  scenario "User visits home page and creates a new account" do
    visit root_path
    click_on "Sign up"
    page.must_have_content "Password confirmation"
    
  end
end
