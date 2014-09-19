require "test_helper"

feature "Editing A Post" do
  let(:new_post) {NewPostPage.new}
  let(:edit_post) {EditPostPage.new}
  scenario "submit updates to an existing post" do
    #Given a post exists
    sign_in(:author)
    visit '/posts/new'
    new_post.fill_post
    click_on 'Create Post'
    #When we show a list of posts
    visit '/posts'
    #Then confirm we have visited the correct post 
    page.must_have_content "Code Fellows Portfolio"
    page.wont_have_content "Dutchman's Holiday"
    #Then click on post to edit 
    page.all(:link,"Edit")[0].click
    #Then fill in the post fields
    edit_post.fill_fields
    #Then click to update post
    click_on "Update Post"
    #Then the updated post page should be shown and have text 'Post successfully updated'
    page.must_have_content "Post was successfully updated."
    page.must_have_content "Fishing for Blackmouth"
  end
end
