require "test_helper"

feature "An editor Deleting an offensive Post" do
  let(:new_post) {NewPostPage.new}
  scenario "delete an offensive post" do
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: users(:editor).email
    fill_in "user_password", with: "secretpwd49"
    # visit '/posts/new'
    # new_post.fill_post
    # click_on 'Create Post'
    # new_post.visit_index_page
    # page.all(:link,"Destroy")[0].click
    # page.driver.browser.accept_js_confirms
  end
end
