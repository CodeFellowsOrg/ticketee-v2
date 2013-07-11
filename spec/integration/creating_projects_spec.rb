require 'spec_helper'

feature 'Creating Projects' do
  before do
    visit '/'
    click_link 'New Project'
  end

  scenario "can create a project" do
    fill_in 'Name', :with => 'Vim FOREVAH!'
    click_button 'Henceforth the project shall be created'
    page.should have_content('Project has been created.')

    project = Project.find_by_name("Vim FOREVAH!")
    page.current_url.should == project_url(project)
    find("title").should have_content("Vim FOREVAH! - Projects - Ticketee")
  end

  scenario "can not create a project without a name" do
    click_button 'Henceforth the project shall be created'
    page.should have_content("Project has not been created.")
    page.should have_content("Name can't be blank")
  end
end
