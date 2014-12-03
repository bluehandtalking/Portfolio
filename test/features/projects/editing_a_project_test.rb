require "test_helper"

feature "Projects::EditingAProjectTest" do
  let(:project) {ProjectPage.new}
  scenario "Author submits updates to an existing project they own" do
    #Given a project exists
    sign_in(:author)
    visit new_project_path
    project.build_project
    click_on "Create Project"
    #We should be on project page we just created
    page.must_have_content "Code Fellows Portfolio" 
    #Then click on project to edit 
    
    click_on 'Edit'
    fill_in 'Name', with: 'Noodle Man'
    click_on "Update Project"
    #Then the updated project page should be shown and have text 'Project successfully updated'
    page.must_have_content "Project was successfully updated."
    page.must_have_content "Noodle Man"
    page.wont_have_content "Code Fellows Portfolio"

  end
end
