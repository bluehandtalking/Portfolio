require "test_helper"

feature "VisitingThePostIndex" do
  scenario "a listing of all posts"  do
      visit posts_path
      page.must_have_content "nail clippers"
      page.wont_have_content "Dutchman's Holiday"
  end
end
