require "test_helper"

feature "An editor Deleting an offensive Post" do
  scenario "An author signs in but can not destroy a post" do
    sign_in(:author)
    visit posts_path
    page.wont_have_link "Destroy"
  end
  scenario "A guest signs in but can not destroy a post" do
    sign_in(:guest)
    visit posts_path
    page.wont_have_link "Destroy"
  end  
  scenario "Editor signs in and deletes an offensive post" do
    sign_in('editor')
    posts(:wave)
    visit posts_path
    page.must_have_content "Riding the Wave"
    page.find(:xpath, "//a[starts-with(@href, '/posts/#{posts(:wave).id}')][@data-method='delete']").click
    page.driver.browser.accept_js_confirms
    page.wont_have_content "Riding the Wave"

  end
end
