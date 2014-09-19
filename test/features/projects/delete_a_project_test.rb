require "test_helper"

feature "Deleting A Project  by editor" do
  scenario "User visits site and is not able to delete a project" do
    visit projects_path
    page.wont_have_link "Destroy"
  end

  scenario "Author signs in and attempt to delete project but fails" do
    sign_in(:author)
    visit projects_path
    page.wont_have_link "Destroy"
  end

  scenario "Editor deletes an offensive project" do
    sign_in(:editor)
    visit projects_path
    page.must_have_content "Coho in Washington State"
    # page.find(:xpath, "//a[@href='/projects/#{projects(:fishing).id}']").click
    page.find(:xpath, "//a[starts-with(@href, '/projects/#{projects(:fishing).id}')][@data-method='delete']").click

    page.driver.browser.accept_js_confirms
    page.wont_have_content "Coho in Washington State"
  end
end
