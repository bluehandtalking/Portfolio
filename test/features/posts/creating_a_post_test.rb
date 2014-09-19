require 'test_helper'

feature "Accessing the site in roles of visitor, author, or editor to allow different create permissions and show different post status" do
  scenario "Visitor not signed in can view the posts index" do
    visit posts_path
  end
  scenario "Visitor attempts to go to new_post_path, but is unable to do so" do
    # Given a visitor attempts to create a new post 
    visit root_path
    # Then the message is displayed to sign in, preventing unauthorized posting
    page.must_have_content "Being Here"
    # Then visitor attempts to navigate to new_post_path but is returned to root_path
    visit new_post_path
    page.has_no_content?  "New post"
  end
  scenario "Author only sees their posts when visiting post index" do
    sign_in(:author)
    visit posts_path
    page.must_have_content posts(:wave).title
    page.wont_have_content posts(:life).title
  end
  scenario "An author signs in, visits new_post_path, creates a post" do
    sign_in(:author)
    visit new_post_path
    page.must_have_content "New post"
    # click_on "Blog"
    # click_on "New Post"
    fill_in "post_title" , with: 'New Horizons'
    fill_in "Description" , with: 'Traveling to the End of Time'
    fill_in "Content", with: 'A long voyage will always end where it began'
    click_on "Create Post"
    page.must_have_content 'A long voyage will always end where it began' 
    page.must_have_content      'Post was successfully created.'
 
  end
  scenario "An author signs in but can not publish a post" do
    sign_in(:author)
    visit posts_path
    page.wont_have_link "Publish"
  end
  scenario "The editor signs in and publishes a post" do
    sign_in(:editor)
    visit posts_path
    page.find(:xpath, "//a[starts-with(@href, '/posts/publish/#{posts(:being).id}')]").click
    click_on "Sign out"
    visit posts_path
    page.must_have_content posts(:being).title
  end
end
