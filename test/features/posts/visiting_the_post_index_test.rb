require "test_helper"

feature "Visiting the Posts Index, a list of posts is seen" do
  scenario "User visits the posts index and sees 3 posts "  do
    # first, a valid users creates 3 posts
    sign_in(:author)
    posts(:wave)
    posts(:being)
    posts(:life)
    visit '/posts'
    page.must_have_content "Riding the Wave"
    page.must_have_content "Being There"
    page.must_have_content "A Day in the Life of Peter Yanovich"
    page.wont_have_content "Dutchman's Holiday"
  end
end
