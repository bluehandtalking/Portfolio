require "test_helper"

feature "VisitingThePostIndex" do
  let(:show_posts) {ShowPosts.new}
  scenario "with existing post, show list"  do
      #Given existing posts --provided by  ActiveSupport::TestCase ---fixtures :all
      #When I visit/posts
      show_posts.visit_page
      #Then the exiisting post should exist, confirmed by content
      page.must_have_content "nail clippers"
      #Then the existing post should be confirmed by content absent
      page.wont_have_content "Dutchman's Holiday"
  end
end
