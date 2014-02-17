require "test_helper"

feature "A user visits the post show and makes a comment" do
  scenario "After visiting the post page, user enters name, email, and a message" do
    visit posts_show
    click_on "/posts/1"
  end
end

