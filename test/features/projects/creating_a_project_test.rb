require "test_helper"

feature "Projects::CreatingAProject" do
  let(:new_project) {NewProjectPage.new}
  scenario "a user should be able to create a post"  do
    new_project.visit_page
    new_project.build_project
    click_on 'Create Project'
    page.text.must_include 'Project was successfully created'
    page.text.must_include 'Code Fellows Portfolio'
  end
end

