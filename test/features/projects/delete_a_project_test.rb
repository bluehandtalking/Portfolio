require "test_helper"

feature "Deleting A Project" do
  let(:new_project) {NewProjectPage.new}
  scenario "delete an offensive project" do
    new_project.visit_page
    new_project.build_project
    click_on 'Create Project'
    visit  '/projects'
    # page.find("a[ href = '#{project_path(project(:portfolio))}'][data-method-delete]").click
    page.all(:link,"Destroy")[0].click
    page.driver.browser.accept_js_confirms
  end
end
