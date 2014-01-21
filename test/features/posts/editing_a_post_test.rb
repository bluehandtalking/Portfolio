require "test_helper"

feature "Editing A Post" do
  let(:new_post) {NewPostPage.new}
  let(:edit_post) {EditPostPage.new}
  scenario "submit updates to an existing post" do
    #Given a post exists
    new_post.visit_page
    new_post.build_post
    click_on 'Create Post'
    #When we show a list of posts
    new_post.visit_index_page
    #Then confirm we have visited the correct post 
    page.must_have_content "spherical skeg"
    page.wont_have_content "Dutchman's Holiday"
    #Then click on post to edit 
    page.all(:link,"Edit")[0].click
    #Then fill in the post fields
    edit_post.fill_fields

    #Then change field content
    # find(:linkhref, '/posts/1/edit').click 
    # find(:xpath, "//a[@href='/posts/3/edit']").click 
    # click_link("Edit", href: '/posts/1/edit')
    # page.must_have_content "Edit"

    #Then click to update post
    click_on "Update Post"
    #Then the updated post page should be shown and have text 'Post successfully updated'
    page.must_have_content "Post was successfully updated."
  end
end
