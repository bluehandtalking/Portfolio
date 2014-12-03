require "test_helper"

feature "Creating, Editing and Updating A Post" do
  let(:edit_post) {EditPostPage.new}
  scenario "Guest tries to edit a post owned by an author" do
    sign_in(:guest)
    visit posts_path
    page.wont_have_link "Destroy"
  end
  scenario "Author updates a post they own " do
    sign_in(:author)
    visit '/posts/new'
    visit '/posts'
    page.must_have_content posts(:wave).title
    page.wont_have_content "Dutchman's Holiday"
    page.find(:xpath, "//a[starts-with(@href, '/posts/#{posts(:wave).id}/edit')]").click
    edit_post.fill_fields
    click_on "Update Post"
    page.text.must_include "Post was successfully updated."
    page.must_have_content "Fishing for Blackmouth"
  end
end
