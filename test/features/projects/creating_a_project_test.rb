require "test_helper"

feature "Author signs in to the site" do
  scenario "Author should be able to create a post"  do
    sign_in('author')
    visit new_project_path
    new_project.build_project
    click_on 'Create Project'
    page.text.must_include 'Project was successfully created'
    page.text.must_include 'Code Fellows Portfolio'
  end
end

