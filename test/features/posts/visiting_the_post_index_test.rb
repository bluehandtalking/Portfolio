require "test_helper"

feature "VisitingThePostIndex" do
  let(:new_post) {NewPostPage.new}
  let(:index_posts) {IndexPosts.new}
  scenario "with existing post, show list"  do
      #Given existing posts --provided by  ActiveSupport::TestCase ---fixtures :all
    new_post.visit_page
    new_post.build_post
    click_on 'Create Post'
    #When I visit/posts
    index_posts.visit_page
    #Then the exiisting post should exist, confirmed by content
    page.must_have_content "Amazing Life of Web"
    #Then the existing post should be confirmed by content absent
    page.wont_have_content "Dutchman's Holiday"
  end
end
