require "test_helper"

feature "Projects::EditingAProjectTest" do
  let(:new_project) {NewProjectPage.new}
  let(:edit_project) {EditProjectPage.new}
  scenario "submit updates to an existing project" do
    #Given a project exists
    new_project.visit_page
    new_project.build_project
    click_on 'Create Project'
    #When we show a list of projects
    edit_project.visit_index_page
    #Then confirm we have visited the correct project 
    page.must_have_content "Code Fellows Portfolio"
    page.wont_have_content "Dutchman's Holiday"
    #Then click on project to edit 
    page.all(:link,"Edit")[0].click
    #Then fill in the project fields
    edit_project.fill_fields
    #Then click to update project
    click_on "Update Project"
    #Then the updated project page should be shown and have text 'Project successfully updated'
    page.must_have_content "Project was successfully updated."

  end
end
