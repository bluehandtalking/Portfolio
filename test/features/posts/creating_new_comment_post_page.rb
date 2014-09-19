require "test_helper"

feature "A user visits the post show and makes a comment" do
  scenario "After visiting the post page, user enters name, email, and a message" do
    sign_in(:author)
    posts(:wave)
    visit blogs_path(posts(:wave).id)
    page.must_have_content "Riding the Wave"
    # find(:xpath, "//a[@href='/blogs/1']").click 
  end
end

