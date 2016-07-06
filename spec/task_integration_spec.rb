require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expections, false)


describe('tasks path', {:type => :feature}) do
  it('takes a tasks and adds it to the task list') do
    visit('/tasks')
    fill_in('description', :with => 'make bed')
    click_button('Submit')
    expect(page).to have_content('make bed')
  end
end
