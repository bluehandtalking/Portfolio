require "test_helper"

feature "Creating A Post" do
  let(:new_post) {NewPostPage.new}
  scenario "submitting form data to create a new post" do

    #given I visi tthe  page to create a new post
    new_post.visit_page
    #Then I fill in the data for the post to build it
    new_post.build_post
    #Then I submit the form
    click_on 'Create Post'
    #Then a new post should be created and displayed
    page.text.must_include 'Post was successfully created'
    page.text.must_include 'goodness of Rails'
  end
end
