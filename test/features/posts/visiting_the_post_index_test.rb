require "test_helper"

feature "Visiting the Posts Index, a list of published posts is seen" do
  scenario "User not signed in visits the posts index and sees published posts "  do
    visit posts_path
    page.must_have_content posts(:wave).title
    page.wont_have_content posts(:being).title
  end
end
