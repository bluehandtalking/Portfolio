require "test_helper"

feature "Author creates a new project" do
  let(:project) {ProjectPage.new}

  scenario "Visitor not signed in attempts to create project and fails" do
    visit projects_path
    page.wont_have_link "New Project"
  end

  scenario "Guest user attempts to create a new project but fails" do
    sign_in(:guest)
    visit projects_path
    page.wont_have_link "New Project"
  end
  
  scenario "Author signs in, visits new project page and  creates a project"  do
    sign_in(:author)
    visit new_project_path
    project.build_project
    click_on "Create Project"
    page.text.must_include 'Project was successfully created.'
    page.text.must_include 'Code Fellows Portfolio'
  end
end

