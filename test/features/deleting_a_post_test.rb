require "test_helper"

feature "Deleting A Post" do
  let(:new_post) {NewPostPage.new}
  scenario "delete an offensive post" do
    new_post.visit_page
    new_post.build_post
    click_on 'Create Post'
    new_post.visit_index_page
    page.all(:link,"Destroy")[0].click
    page.driver.browser.accept_js_confirms
  end
end
