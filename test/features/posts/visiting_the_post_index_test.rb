require "test_helper"

feature "VisitingThePostIndex" do
  let(:new_post) {NewPostPage.new}
  let(:index_posts) {IndexPosts.new}
  scenario "with existing post, show list"  do
      #Given existing posts --provided by  ActiveSupport::TestCase ---fixtures :all
    visit '/posts/new'
    new_post.fill_post
    click_on 'Create Post'
    #When I visit/posts
    visit '/posts'
    #Then the exiisting post should exist, confirmed by content
    page.must_have_content "Amazing Life of Web"
    #Then the existing post should be confirmed by content absent
    page.wont_have_content "Dutchman's Holiday"
  end
end
