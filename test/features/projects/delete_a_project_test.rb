require "test_helper"

feature "Deleting A Project  by editor" do
  let(:project) {ProjectPage.new}
  scenario "delete an offensive project" do
    sign_in('editor')
    visit new_project_path
    project.build_project
    visit projects_path
    page.find("a[href='#{project_path(projects(:fishing).id)}'][data-method='delete']").click
    page.wont__have_content "Code Fellows Portfolio"
    # page.driver.browser.accept_js_confirms
  end
end
