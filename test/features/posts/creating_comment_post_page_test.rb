require "test_helper"

feature "A user visits the post show and makes a comment" do
  scenario "User not signed in tries to create a comment" do
    visit post_path(posts(:wave).id)
    page.must_have_content "Riding the Wave"
    page.wont_have_link "Create Comment"
  end
  scenario "A guest user signs in and creates a comment" do
    sign_in(:guest)
    visit post_path(posts(:wave).id)
    page.must_have_content "Riding the Wave"
    fill_in "Author", with: users(:guest).name
    fill_in "Author email", with: users(:guest).email
    fill_in "Comment", with: "A lovely way to spend the day"
    click_on "Create Comment"
    page.must_have_content "A lovely way to spend the day" 
  end

end

